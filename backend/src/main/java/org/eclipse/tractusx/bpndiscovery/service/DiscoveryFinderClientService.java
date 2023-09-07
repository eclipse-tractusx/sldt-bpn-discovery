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

import org.eclipse.tractusx.bpndiscovery.dto.discoveryfinder.DiscoveryEndpoint;
import org.eclipse.tractusx.bpndiscovery.dto.discoveryfinder.DiscoveryEndpointCollection;
import org.eclipse.tractusx.bpndiscovery.dto.discoveryfinder.SearchRequest;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

@Service
public class DiscoveryFinderClientService {
   private final WebClient webClient;

   public DiscoveryFinderClientService( final WebClient webClient ) {
      this.webClient = webClient;
   }

   public DiscoveryEndpointCollection searchEntries( SearchRequest searchRequest ) {
      return webClient.post().uri( "/api/v1.0/administration/connectors/discovery/search" )
            .contentType( MediaType.APPLICATION_JSON )
            .accept( MediaType.APPLICATION_JSON )
            .bodyValue( searchRequest )
            .retrieve()
            .bodyToMono( DiscoveryEndpointCollection.class )
            .block();
   }

   public DiscoveryEndpoint addDiscoveryEndpoint( DiscoveryEndpoint discoveryEndpoint ) {
      return webClient.post().uri( "/api/v1.0/administration/connectors/discovery" )
            .contentType( MediaType.APPLICATION_JSON )
            .accept( MediaType.APPLICATION_JSON )
            .bodyValue( discoveryEndpoint )
            .retrieve()
            .bodyToMono( DiscoveryEndpoint.class )
            .block();
   }

   public void deleteDiscoveryEndpoint( String resourceId ) {
      webClient.delete().uri( "/api/v1.0/administration/connectors/discovery/" + resourceId )
            .accept( MediaType.APPLICATION_JSON )
            .retrieve()
            .toBodilessEntity()
            .block();
   }
}
