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

import java.util.List;

import org.eclipse.tractusx.bpndiscovery.dto.discoveryfinder.DiscoveryEndpoint;
import org.eclipse.tractusx.bpndiscovery.dto.discoveryfinder.DiscoveryEndpointCollection;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.boot.test.system.CapturedOutput;
import org.springframework.boot.test.system.OutputCaptureExtension;

import com.fasterxml.jackson.core.JsonProcessingException;

@ExtendWith( OutputCaptureExtension.class )
public class RegisterServiceTest extends AbstractDiscoveryFinderClientTest {

   @Test
   public void givenValidData_alreadyRegisteredService_registerOnStartup_thenSuccess() throws JsonProcessingException {
      // given
      DiscoveryEndpoint givenDiscoveryEndpoint = applicationDiscoveryEndpoint();
      DiscoveryEndpointCollection givenDiscoveryCollection = new DiscoveryEndpointCollection( List.of( givenDiscoveryEndpoint ) );

      // add wiremock stubs
      addStubForAuthorization();
      addStubForSearch( givenDiscoveryCollection );
      addStubForDelete( givenDiscoveryEndpoint.getResourceId() );
      addStubForSave( givenDiscoveryEndpoint );

      // when
      registerService.registerAfterStartup();

      // then
      wireMockServer.verify( 1, deleteRequestedFor( urlEqualTo( "/api/administration/connectors/discovery/" + givenDiscoveryEndpoint.getResourceId() ) ) );
      wireMockServer.verify( 1, postRequestedFor( urlEqualTo( "/api/administration/connectors/discovery" ) ) );
      wireMockServer.verify( 1, postRequestedFor( urlEqualTo( "/api/administration/connectors/discovery/search" ) ) );
   }

   @Test
   public void givenValidData_service_Not_Registered_registerOnStartup_thenSuccess() throws JsonProcessingException {
      //given
      DiscoveryEndpoint givenDiscoveryEndpoint = applicationDiscoveryEndpoint();

      // add wiremock stubs
      addStubForAuthorization();
      addStubForSearch( new DiscoveryEndpointCollection( List.of() ) );
      addStubForSave( givenDiscoveryEndpoint );

      //when
      registerService.registerAfterStartup();

      // then
      wireMockServer.verify( 0, deleteRequestedFor( urlEqualTo( "/api/administration/connectors/discovery/" ) ) );
      wireMockServer.verify( 1, postRequestedFor( urlEqualTo( "/api/administration/connectors/discovery/search" ) ) );
      wireMockServer.verify( 1, postRequestedFor( urlEqualTo( "/api/administration/connectors/discovery" ) ) );
   }

   @Test
   public void givenNonExistingResourceID_registerOnStartup_thenWebClientResponseExceptionNotFound( CapturedOutput output )
         throws JsonProcessingException {
      // given
      DiscoveryEndpoint givenDiscoveryEndpoint = applicationDiscoveryEndpoint();
      DiscoveryEndpointCollection givenDiscoveryCollection = new DiscoveryEndpointCollection( List.of( givenDiscoveryEndpoint ) );

      // add wiremock stubs
      addStubForAuthorization();
      addStubForSearch( givenDiscoveryCollection );
      wireMockServer.stubFor( delete( "/api/administration/connectors/discovery/" + givenDiscoveryEndpoint.getResourceId() )
            .willReturn( aResponse().withStatus( 404 ) ) );

      // when
      registerService.registerAfterStartup();

      // then
      assertThat( output ).contains( "The resourceID could not be found! " );
   }

   @Test
   public void givenInvalidResourceID_serviceAlreadyRegistered_registerOnStartup_thenWebClientResponseExceptionBadRequest( CapturedOutput output )
         throws JsonProcessingException {
      // given
      DiscoveryEndpoint givenDiscoveryEndpoint = applicationDiscoveryEndpoint();
      DiscoveryEndpointCollection givenDiscoveryCollection = new DiscoveryEndpointCollection( List.of( givenDiscoveryEndpoint ) );

      // add wiremock stubs
      addStubForAuthorization();
      addStubForSearch( givenDiscoveryCollection );
      wireMockServer.stubFor( delete( "/api/administration/connectors/discovery/" + applicationDiscoveryEndpoint().getResourceId() )
            .willReturn( aResponse().withStatus( 400 ) ) );

      // when
      registerService.registerAfterStartup();

      // then
      assertThat( output ).contains( "Validation failed or this entry already exists! " );
   }

   @Test
   public void givenInvalidCredentials_registerOnStartup_thenWebClientResponseExceptionUnauthorized( CapturedOutput output ) {
      // given
      wireMockServer.stubFor( post( urlEqualTo( "/realms/discovery/protocol/openid-connect/token" ) )
            .willReturn( unauthorized().withStatus( 401 ) ) );

      // when
      registerService.registerAfterStartup();

      // then
      assertThat( output ).contains( "Authorization Failed! ", "401 Unauthorized" );
   }

   @Test
   public void givenTokenNoRoles_registerOnStartup_thenWebClientResponseExceptionForbidden( CapturedOutput output ) {
      // given -> add wiremock stubs
      wireMockServer.stubFor( post( urlEqualTo( "/realms/discovery/protocol/openid-connect/token" ) )
            .willReturn( unauthorized().withStatus( 403 ) ) );

      // when
      registerService.registerAfterStartup();

      // then
      assertThat( output ).contains( "Authorization Failed! ", "403 Forbidden" );
   }

   @Test
   public void givenDiscoveryFinderIsDown_whenRegisterOnStartup_thenWebClientRequestException( CapturedOutput output ) {
      //given -> add wiremock stubs
      addStubForAuthorization();
      wireMockServer.stubFor( post( "/api/administration/connectors/discovery/search" )
            .willReturn( aResponse().withStatus( 500 ) ) );

      // when
      registerService.registerAfterStartup();

      // then
      assertThat( output ).contains( "Something went wrong" );
   }
}
