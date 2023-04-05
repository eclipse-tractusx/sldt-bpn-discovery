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
package org.eclipse.tractusx.bpndiscovery.controller;

import java.util.List;
import java.util.Optional;

import org.eclipse.tractusx.bpndiscovery.api.DiscoveryApiDelegate;
import org.eclipse.tractusx.bpndiscovery.dto.BatchResultDto;
import org.eclipse.tractusx.bpndiscovery.dto.BpnDiscoveryCollectionDto;
import org.eclipse.tractusx.bpndiscovery.dto.TypeKeysIdentifierDto;
import org.eclipse.tractusx.bpndiscovery.mapper.BpnDiscoveryMapper;
import org.eclipse.tractusx.bpndiscovery.model.Bpn;
import org.eclipse.tractusx.bpndiscovery.model.BpnCollection;
import org.eclipse.tractusx.bpndiscovery.model.BpnDiscovery;
import org.eclipse.tractusx.bpndiscovery.model.IdentifierTypeKeyPair;
import org.eclipse.tractusx.bpndiscovery.model.SearchRequest;
import org.eclipse.tractusx.bpndiscovery.model.TypeKeyPairBatchResult;
import org.eclipse.tractusx.bpndiscovery.service.BpnDiscoveryService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.NativeWebRequest;

@Service
public class BpnDiscoveryApiDelegate implements DiscoveryApiDelegate {

   private final BpnDiscoveryService bpnDiscoveryService;
   private final BpnDiscoveryMapper bpnDiscoveryMapper;

   public BpnDiscoveryApiDelegate( final BpnDiscoveryService bpnDiscoveryService, final BpnDiscoveryMapper bpnDiscoveryMapper ) {
      this.bpnDiscoveryService = bpnDiscoveryService;
      this.bpnDiscoveryMapper = bpnDiscoveryMapper;
   }

   @Override
   public Optional<NativeWebRequest> getRequest() {
      return DiscoveryApiDelegate.super.getRequest();
   }

   @Override
   public ResponseEntity<Void> deleteBpnDiscoveryById( String resourceId ) {
      bpnDiscoveryService.deleteBpnDiscovery( resourceId );
      return new ResponseEntity<>( HttpStatus.NO_CONTENT );
   }

   @Override
   public ResponseEntity<BpnCollection> getBpnDiscoveries( SearchRequest searchRequest ) {
      List<TypeKeysIdentifierDto> searchFilterDto = bpnDiscoveryMapper.fromSearchListApiDto( searchRequest.getSearchFilter() );
      BpnDiscoveryCollectionDto collectionDto = bpnDiscoveryService.findBpnDiscoveries( searchFilterDto );
      return new ResponseEntity<>( bpnDiscoveryMapper.toApiDto( collectionDto ), HttpStatus.OK );
   }

   @Override
   public ResponseEntity<List<TypeKeyPairBatchResult>> postBatchBpnDiscovery( List<IdentifierTypeKeyPair> identifierTypeKeyPair ) {
      List<BpnDiscovery> discoveries = bpnDiscoveryMapper.fromListApiDto( identifierTypeKeyPair );
      List<BatchResultDto> batchResult = bpnDiscoveryService.saveBatch( discoveries );
      return new ResponseEntity<>( bpnDiscoveryMapper.toListApiDto( batchResult ), HttpStatus.CREATED );
   }

   @Override
   public ResponseEntity<Bpn> postBpnDiscovery( IdentifierTypeKeyPair identifierTypeKeyPair ) {
      BpnDiscovery bpnDiscovery = bpnDiscoveryService.save( bpnDiscoveryMapper.fromApiDto( identifierTypeKeyPair ) );
      return new ResponseEntity<>( bpnDiscoveryMapper.toApiDto( bpnDiscovery ), HttpStatus.CREATED );
   }
}