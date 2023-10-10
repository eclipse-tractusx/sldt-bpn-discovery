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
import static org.assertj.core.api.AssertionsForInterfaceTypes.assertThat;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.util.List;

import org.eclipse.tractusx.bpndiscovery.dto.discoveryfinder.DiscoveryEndpoint;
import org.eclipse.tractusx.bpndiscovery.dto.discoveryfinder.DiscoveryEndpointCollection;
import org.eclipse.tractusx.bpndiscovery.dto.discoveryfinder.SearchRequest;
import org.junit.jupiter.api.Test;
import org.springframework.security.oauth2.core.OAuth2AuthorizationException;

import com.fasterxml.jackson.core.JsonProcessingException;

public class DiscoveryFinderClientServiceTest extends AbstractDiscoveryFinderClientTest {

   @Test
   public void givenOenSearchRequest_whenSearch_returnResult() throws JsonProcessingException {
      //given
      DiscoveryEndpointCollection givenDiscoveryCollection = new DiscoveryEndpointCollection( List.of( dummyDiscoveryEndpoint() ) );
      SearchRequest givenSearchRequest = new SearchRequest().types( List.of( "oen" ) );

      // add wiremock stubs
      addStubForAuthorization();
      addStubForSearch( givenSearchRequest, givenDiscoveryCollection );

      //when
      DiscoveryEndpointCollection actualCollection = discoveryFinderClientService.searchEntries( givenSearchRequest );

      //then
      assertThat( actualCollection ).isInstanceOf( DiscoveryEndpointCollection.class );
      assertThat( actualCollection.equals( givenDiscoveryCollection ) );
   }

   @Test
   public void givenResourceId_whenDelete_thenSuccess() {
      //given
      String givenResourceId = "resourceId-1";

      // add wiremock stubs
      addStubForAuthorization();
      addStubForDelete( givenResourceId );

      // when
      discoveryFinderClientService.deleteDiscoveryEndpoint( givenResourceId );

      // then
      wireMockServer.verify( deleteRequestedFor( urlEqualTo( "/api/v1.0/administration/connectors/discovery/" + givenResourceId ) ) );
   }

   @Test
   public void givenValidEndpoint_whenSave_thenSuccess() throws JsonProcessingException {
      //given
      DiscoveryEndpoint givenEndpoint = dummyDiscoveryEndpoint();

      // add wiremock stubs
      addStubForAuthorization();
      addStubForSave( givenEndpoint );

      // when
      DiscoveryEndpoint actualEndpoint = discoveryFinderClientService.addDiscoveryEndpoint( givenEndpoint );

      // then
      wireMockServer.verify( postRequestedFor( urlEqualTo( "/api/v1.0/administration/connectors/discovery" ) ) );
      assertThat( actualEndpoint ).isEqualTo( givenEndpoint );
   }

   @Test
   public void InvalidToken_WhenSearchEntries_ThenGetUnauthorized() {
      //given
      wireMockServer.stubFor( post( urlEqualTo( "/realms/discovery/protocol/openid-connect/token" ) )
            .willReturn( unauthorized().withStatus( 401 ) ) );

      //when
      Exception actualException = assertThrows( OAuth2AuthorizationException.class,
            () -> discoveryFinderClientService.searchEntries( new SearchRequest().types( List.of( "oen" ) ) ) );

      //then
      assertThat( actualException ).isInstanceOf( OAuth2AuthorizationException.class );
      assertThat( actualException.getMessage() ).contains( "401 Unauthorized" );
   }

   @Test
   public void InvalidTokenNoRoles_WhenRegisterService_ThenGetForbidden() {
      //given
      wireMockServer.stubFor( post( urlEqualTo( "/realms/discovery/protocol/openid-connect/token" ) )
            .willReturn( unauthorized().withStatus( 403 ) ) );

      //when
      Exception exception = assertThrows( OAuth2AuthorizationException.class,
            () -> discoveryFinderClientService.searchEntries( new SearchRequest().types( List.of( "oen" ) ) ) );

      //then
      assertThat( exception ).isInstanceOf( OAuth2AuthorizationException.class );
      assertThat( exception.getMessage() ).contains( "403 Forbidden" );
   }
}
