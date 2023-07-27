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

import java.util.List;
import java.util.Optional;

import org.eclipse.tractusx.bpndiscovery.BpnDiscoveryProperties;
import org.eclipse.tractusx.bpndiscovery.dto.discoveryfinder.DiscoveryEndpoint;
import org.eclipse.tractusx.bpndiscovery.dto.discoveryfinder.DiscoveryEndpointCollection;
import org.eclipse.tractusx.bpndiscovery.dto.discoveryfinder.SearchRequest;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.oauth2.core.OAuth2AuthorizationException;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClientRequestException;
import org.springframework.web.reactive.function.client.WebClientResponseException;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RegisterService {

   private final BpnDiscoveryProperties bpnDiscoveryProperties;
   private final DiscoveryFinderClientService discoveryFinderClientService;

   public RegisterService( final BpnDiscoveryProperties bpnDiscoveryProperties, final DiscoveryFinderClientService discoveryFinderClientService ) {
      this.bpnDiscoveryProperties = bpnDiscoveryProperties;
      this.discoveryFinderClientService = discoveryFinderClientService;
   }

   @Scheduled( cron = "${bpndiscovery.scheduler}" )
   public void registerAfterStartup() {
      bpnDiscoveryProperties.getAllowedTypes().forEach( type -> {
         try {
            DiscoveryEndpointCollection entries = discoveryFinderClientService.searchEntries( new SearchRequest().types( List.of( type ) ) );
            Optional<DiscoveryEndpoint> isEntryExisting = isEntryPartOfCollection( entries.getEndpoints(), type );

            if ( isEntryExisting.isPresent() ) {
               discoveryFinderClientService.deleteDiscoveryEndpoint( isEntryExisting.get().getResourceId() );
            }
            discoveryFinderClientService.addDiscoveryEndpoint( createDiscoveryEndpointRequest( type ) );
            log.info( "The service has been successfully registered!" );

         } catch ( WebClientResponseException.BadRequest badRequestEx ) {
            log.error( "Validation failed or this entry already exists! " + badRequestEx.getMessage(), badRequestEx.getCause() );
         } catch ( WebClientResponseException.NotFound notFoundEx ) {
            log.error( "The resourceID could not be found! " + notFoundEx.getMessage(), notFoundEx.getCause() );
         } catch ( WebClientRequestException webClientRequestException ) {
            log.error( "Something went wrong with your requests! " + webClientRequestException.getMessage(), webClientRequestException.getCause() );
         } catch ( OAuth2AuthorizationException oAuth2AuthorizationException ) {
            log.error( "Authorization Failed! " + oAuth2AuthorizationException.getMessage(), oAuth2AuthorizationException.getCause() );
         } catch ( Exception e ) {
            log.error( "Something went wrong!" + e.getMessage(), e.getCause() );
         }
      } );
   }

   private Optional<DiscoveryEndpoint> isEntryPartOfCollection( List<DiscoveryEndpoint> entries, String type ) {
      return entries.stream()
            .filter( ep -> ep.getEndpointAddress().equals( bpnDiscoveryProperties.getEndpointAddress() ) && ep.getType().equals( type ) )
            .findAny();
   }

   private DiscoveryEndpoint createDiscoveryEndpointRequest( String type ) {
      return DiscoveryEndpoint.builder()
            .type( type )
            .description( bpnDiscoveryProperties.getDescription() )
            .endpointAddress( bpnDiscoveryProperties.getEndpointAddress() )
            .documentation( bpnDiscoveryProperties.getDocumentation() ).build();
   }
}
