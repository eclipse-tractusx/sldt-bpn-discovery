/********************************************************************************
 * Copyright (c) 2023 Robert Bosch Manufacturing Solutions GmbH
 * Copyright (c) 2023 Contributors to the Eclipse Foundation
 *
 * See the NOTICE file(s) distributed with this work for additional
 * information regarding copyright ownership.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Apache License, Version 2.0 which is available at
 * https://www.apache.org/licenses/LICENSE-2.0.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 ********************************************************************************/
package org.eclipse.tractusx.bpndiscovery.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.eclipse.tractusx.bpndiscovery.dto.BatchResultDto;
import org.eclipse.tractusx.bpndiscovery.dto.BpnDiscoveryCollectionDto;
import org.eclipse.tractusx.bpndiscovery.dto.TypeKeysIdentifierDto;
import org.eclipse.tractusx.bpndiscovery.model.BpnDiscovery;
import org.eclipse.tractusx.bpndiscovery.repository.BpnDiscoveryRepository;
import org.eclipse.tractusx.bpndiscovery.security.ClientAware;
import org.eclipse.tractusx.bpndiscovery.service.utils.UuidUtils;
import org.eclipse.tractusx.bpndiscovery.service.validator.BpnDiscoveryValidator;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BpnDiscoveryService {
   private final BpnDiscoveryRepository bpnDiscoveryRepository;
   private final ClientAware clientAware;
   private final BpnDiscoveryValidator bpnDiscoveryValidator;

   public BpnDiscoveryService(
         final BpnDiscoveryRepository bpnDiscoveryRepository,
         final ClientAware clientAware,
         final BpnDiscoveryValidator bpnDiscoveryValidator ) {
      this.bpnDiscoveryRepository = bpnDiscoveryRepository;
      this.clientAware = clientAware;
      this.bpnDiscoveryValidator = bpnDiscoveryValidator;
   }

   @Transactional
   public BpnDiscovery save( BpnDiscovery bpnDiscovery ) {
      BpnDiscovery bpnDiscoveryWithValue = bpnDiscovery.withValue( clientAware.getBpn() );
      bpnDiscoveryValidator.validate( bpnDiscoveryWithValue );
      return bpnDiscoveryRepository.save( bpnDiscoveryWithValue );
   }

   @Transactional( readOnly = true )
   public BpnDiscoveryCollectionDto findBpnDiscoveries( List<TypeKeysIdentifierDto> searchTypeKeyPairs ) {
      List<BpnDiscovery> foundBpnDiscoveries = new ArrayList<>();

      Set<String> givenTypes = searchTypeKeyPairs.stream()
            .map( TypeKeysIdentifierDto::getType ).collect( Collectors.toSet() );

      givenTypes.forEach( givenType -> {
         List<String> identifierKeys = searchTypeKeyPairs.stream()
               .filter( keyPair -> keyPair.getType().equals( givenType ) )
               .flatMap( keyPair -> keyPair.getKeys().stream() )
               .distinct().collect( Collectors.toList() );
         foundBpnDiscoveries.addAll( bpnDiscoveryRepository.findBpnDiscoveriesByTypeAndKeyIn( givenType, identifierKeys ) );
      } );
      return BpnDiscoveryCollectionDto.builder().bpns( foundBpnDiscoveries ).build();
   }

   public List<BatchResultDto> saveBatch( List<BpnDiscovery> bpnDiscoveries ) {
      return bpnDiscoveries.stream().map( bpnDiscovery -> {
         try {
            save( bpnDiscovery );
            return new BatchResultDto( "BpnDiscovery successfully created", null,
                  bpnDiscovery.getKey(), HttpStatus.OK.value() );
         } catch ( Exception e ) {
            if ( e instanceof ValidationException ) {
               ValidationException validationException = (ValidationException) e;
               return new BatchResultDto( "Validation failed.", validationException.getDetails(),
                     bpnDiscovery.getKey(), HttpStatus.BAD_REQUEST.value() );
            }

            if ( e.getCause() instanceof DuplicateKeyException ) {
               return new BatchResultDto( "duplicated entity. Key type combination exists.", null,
                     bpnDiscovery.getKey(), HttpStatus.BAD_REQUEST.value() );
            }
            return new BatchResultDto(
                  String.format( "Failed to create BpnDiscovery %s", e.getMessage() ), null,
                  bpnDiscovery.getKey(), HttpStatus.BAD_REQUEST.value() );
         }
      } ).collect( Collectors.toList() );
   }

   public void deleteBpnDiscovery( String resourceId ) {
      UuidUtils.validateUUID( resourceId );
      BpnDiscovery bpnDiscoveryDb = bpnDiscoveryRepository.findBpnDiscoveryByResourceId( resourceId )
            .orElseThrow( () -> new EntityNotFoundException( String.format( "BpnDiscovery for the resourceId %s not found.", resourceId ) ) );
      clientAware.validateBpnOwnership( bpnDiscoveryDb.getValue() );
      bpnDiscoveryRepository.deleteById( bpnDiscoveryDb.getId() );
   }
}
