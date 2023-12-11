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

import static com.github.tomakehurst.wiremock.client.WireMock.*;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

import org.eclipse.tractusx.bpndiscovery.BpnDiscoveryProperties;
import org.eclipse.tractusx.bpndiscovery.dto.discoveryfinder.DiscoveryEndpoint;
import org.eclipse.tractusx.bpndiscovery.dto.discoveryfinder.DiscoveryEndpointCollection;
import org.eclipse.tractusx.bpndiscovery.dto.discoveryfinder.SearchRequest;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.TestInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.tomakehurst.wiremock.WireMockServer;
import com.github.tomakehurst.wiremock.core.WireMockConfiguration;

@SpringBootTest
@TestInstance( TestInstance.Lifecycle.PER_CLASS )
public abstract class AbstractDiscoveryFinderClientTest {

   @Autowired
   protected DiscoveryFinderClientService discoveryFinderClientService;

   @Autowired
   protected RegisterService registerService;

   @Autowired
   protected BpnDiscoveryProperties bpnDiscoveryProperties;

   protected static WireMockServer wireMockServer;

   private ObjectMapper mapper = new ObjectMapper();

   @BeforeAll
   void setUp() {
      wireMockServer = new WireMockServer( WireMockConfiguration.wireMockConfig().port( 8585 ) );
      wireMockServer.start();
   }

   @AfterEach
   void resetAll() {
      wireMockServer.resetAll();
   }

   @AfterAll
   void tearDown() {
      wireMockServer.stop();
   }

   protected void addStubForAuthorization() {
      wireMockServer.stubFor( post( urlEqualTo( "/realms/discovery/protocol/openid-connect/token" ) )
            .willReturn( okJson( "{\"token_type\": \"Bearer\",\"access_token\":\"dummy-access-token\"}" ) ) );
   }

   protected void addStubForSearch( SearchRequest searchRequest, DiscoveryEndpointCollection response ) throws JsonProcessingException {
      wireMockServer.stubFor( post( "/api/v1.0/administration/connectors/discovery/search" )
            .withRequestBody( equalToJson( toJson( searchRequest ) ) )
            .willReturn( aResponse().withStatus( 200 )
                  .withHeader( "Content-Type", APPLICATION_JSON_VALUE ).withBody( toJson( response ) ) ) );
   }

   protected void addStubForSearch( DiscoveryEndpointCollection response ) throws JsonProcessingException {
      wireMockServer.stubFor( post( "/api/v1.0/administration/connectors/discovery/search" )
            .willReturn( aResponse().withStatus( 200 )
                  .withHeader( "Content-Type", APPLICATION_JSON_VALUE ).withBody( toJson( response ) ) ) );
   }

   protected void addStubForDelete( String resourceId ) {
      wireMockServer.stubFor( delete( "/api/v1.0/administration/connectors/discovery/" + resourceId )
            .willReturn( aResponse().withStatus( 201 ) ) );
   }

   protected void addStubForSave( DiscoveryEndpoint discoveryEndpoint ) throws JsonProcessingException {
      wireMockServer.stubFor( post( "/api/v1.0/administration/connectors/discovery" )
            .willReturn( aResponse().withStatus( 200 ).withHeader( "Content-Type", APPLICATION_JSON_VALUE )
                  .withBody( toJson( discoveryEndpoint ) ) ) );
   }

   public DiscoveryEndpoint dummyDiscoveryEndpoint() {
      return DiscoveryEndpoint.builder()
            .type( "oen" )
            .description( "Service to discover BPN to a particular OEN" )
            .endpointAddress( "http://localhost:8585" )
            .documentation( "http://localhost:8585/swagger/index.html" )
            .resourceId( "123-wxy" )
            .timeToLive( 31536000 )
            .build();
   }

   public DiscoveryEndpoint applicationDiscoveryEndpoint() {
      return DiscoveryEndpoint.builder()
            .type( bpnDiscoveryProperties.getAllowedTypes().get( 0 ) )
            .description( bpnDiscoveryProperties.getDescription() )
            .endpointAddress( bpnDiscoveryProperties.getEndpointAddress() )
            .timeToLive( bpnDiscoveryProperties.getTimeToLive() )
            .resourceId( "resourceId-app-1" )
            .build();
   }

   public String toJson( Object object ) throws JsonProcessingException {
      return mapper.writeValueAsString( object );
   }
}
