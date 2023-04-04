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
package org.eclipse.tractusx.bpndiscovery.security;

import static org.hamcrest.Matchers.is;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.eclipse.tractusx.bpndiscovery.AbstractBpnDiscoveryApiTest;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;

import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

public class BpnDiscoveryApiSecurityTest extends AbstractBpnDiscoveryApiTest {

   @BeforeEach
   public void cleanUp() {
      bpnDiscoveryRepository.deleteAll();
   }

   @Test
   public void givenAuthenticationTokenWithAllRoles_whenSave_thenSuccess() throws Exception {
      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_BASE_PATH )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( toJson( givenPayLoad ) )
                        .with( testJwtTokenFactory.allRoles_andBpn() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isCreated() );
   }

   @Test
   public void givenAuthenticationTokenWithAllRoles_whenBatchSave_thenSuccess() throws Exception {
      //given
      ObjectNode givenOenNode1 = createTypeKeyPayLoad( "oen", "oen-135" );
      ObjectNode givenOenNode2 = createTypeKeyPayLoad( "oen", "oen-136" );
      ArrayNode givenPayload = mapper.createArrayNode()
            .add( givenOenNode1 )
            .add( givenOenNode2 );

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_BATCH_API )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( toJson( givenPayload ) )
                        .with( testJwtTokenFactory.allRoles_andBpn() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isCreated() );
   }

   @Test
   public void givenAuthenticationTokenWithAllRoles_whenSearch_thenSuccess() throws Exception {
      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );
      performBpnCreateRequest( toJson( givenPayLoad ) );

      String givenSearchFilter = "{\"searchFilter\": [{\"type\":\"oen\",\"keys\": [\"oen-133\"]}]}";

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_SEARCH_API )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( givenSearchFilter )
                        .with( testJwtTokenFactory.allRoles_andBpn() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isOk() );
   }

   @Test
   public void givenAuthenticationTokenWithAllRoles_whenDelete_thenSuccess() throws Exception {
      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );
      String givenResourceId = performBpnCreateRequest( toJson( givenPayLoad ) );

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .delete( BPN_DISCOVERY_BASE_PATH + "/{givenResourceId}", givenResourceId )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .with( testJwtTokenFactory.allRoles_andBpn() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isNoContent() );

   }

   @Test
   public void givenAuthenticationToken_onlyAddRole_whenSave_thenSuccess() throws Exception {
      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_BASE_PATH )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( toJson( givenPayLoad ) )
                        .with( testJwtTokenFactory.addBpnDiscoveryEndpoints() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isCreated() );

   }

   @Test
   public void givenAuthenticationToken_onlyAddRole_whenBatchSave_thenSuccess() throws Exception {

      //given
      ObjectNode givenOenNode1 = createTypeKeyPayLoad( "oen", "oen-135" );
      ObjectNode givenOenNode2 = createTypeKeyPayLoad( "oen", "oen-136" );
      ArrayNode givenPayload = mapper.createArrayNode()
            .add( givenOenNode1 )
            .add( givenOenNode2 );

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_BATCH_API )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( toJson( givenPayload ) )
                        .with( testJwtTokenFactory.addBpnDiscoveryEndpoints() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isCreated() );

   }

   @Test
   public void givenAuthenticationToken_onlyAddRole_whenSearch_thenReturnForbidden() throws Exception {

      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );
      performBpnCreateRequest( toJson( givenPayLoad ) );

      String givenSearchFilter = "{\"searchFilter\": [{\"type\":\"oen\",\"keys\": [\"oen-133\"]}]}";

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_SEARCH_API )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( givenSearchFilter )
                        .with( testJwtTokenFactory.addBpnDiscoveryEndpoints() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isForbidden() );

   }

   @Test
   public void givenAuthenticationToken_onlyAddRole_whenDelete_thenReturnForbidden() throws Exception {

      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );
      String givenResourceId = performBpnCreateRequest( toJson( givenPayLoad ) );

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .delete( BPN_DISCOVERY_BASE_PATH + "/{givenResourceId}", givenResourceId )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .with( testJwtTokenFactory.addBpnDiscoveryEndpoints() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isForbidden() );
   }

   @Test
   public void givenAuthenticationToken_onlySearchRole_whenAdding_thenReturnForbidden() throws Exception {

      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_BASE_PATH )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( toJson( givenPayLoad ) )
                        .with( testJwtTokenFactory.searchBpnDiscoveryEndpoints() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isForbidden() );
   }

   @Test
   public void givenAuthenticationToken_onlySearchRole_whenBatchAdding_thenReturnForbidden() throws Exception {

      //given
      ObjectNode givenOenNode1 = createTypeKeyPayLoad( "oen", "oen-135" );
      ObjectNode givenOenNode2 = createTypeKeyPayLoad( "oen", "oen-136" );
      ArrayNode givenPayload = mapper.createArrayNode()
            .add( givenOenNode1 )
            .add( givenOenNode2 );

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_BATCH_API )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( toJson( givenPayload ) )
                        .with( testJwtTokenFactory.searchBpnDiscoveryEndpoints() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isForbidden() );
   }

   @Test
   public void givenAuthenticationToken_onlySearchRole_whenSearch_thenSuccess() throws Exception {

      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );
      performBpnCreateRequest( toJson( givenPayLoad ) );

      String givenSearchFilter = "{\"searchFilter\": [{\"type\":\"oen\",\"keys\": [\"oen-133\"]}]}";

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_SEARCH_API )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( givenSearchFilter )
                        .with( testJwtTokenFactory.searchBpnDiscoveryEndpoints() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isOk() );
   }

   @Test
   public void givenAuthenticationToken_onlySearchRole_whenDelete_thenReturnForbidden() throws Exception {

      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );
      String givenResourceId = performBpnCreateRequest( toJson( givenPayLoad ) );

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .delete( BPN_DISCOVERY_BASE_PATH + "/{givenResourceId}", givenResourceId )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .with( testJwtTokenFactory.searchBpnDiscoveryEndpoints() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isForbidden() );
   }

   @Test
   public void givenAuthenticationToken_onlyDeleteRole_whenAdding_thenReturnForbidden() throws Exception {

      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_BASE_PATH )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( toJson( givenPayLoad ) )
                        .with( testJwtTokenFactory.deleteBpnDiscoveryEndpoints() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isForbidden() );
   }

   @Test
   public void givenAuthenticationToken_onlyDeleteRole_whenBatchAdding_thenReturnForbidden() throws Exception {

      //given
      ObjectNode givenOenNode1 = createTypeKeyPayLoad( "oen", "oen-135" );
      ObjectNode givenOenNode2 = createTypeKeyPayLoad( "oen", "oen-136" );
      ArrayNode givenPayload = mapper.createArrayNode()
            .add( givenOenNode1 )
            .add( givenOenNode2 );

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_BATCH_API )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( toJson( givenPayload ) )
                        .with( testJwtTokenFactory.deleteBpnDiscoveryEndpoints() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isForbidden() );
   }

   @Test
   public void givenAuthenticationToken_onlyDeleteRole_whenSearch_thenReturnForbidden() throws Exception {

      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );
      performBpnCreateRequest( toJson( givenPayLoad ) );

      String givenSearchFilter = "{\"searchFilter\": [{\"type\":\"oen\",\"keys\": [\"oen-133\"]}]}";

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_SEARCH_API )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( givenSearchFilter )
                        .with( testJwtTokenFactory.deleteBpnDiscoveryEndpoints() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isForbidden() );
   }

   @Test
   public void givenAuthenticationToken_onlyDeleteRole_whenDelete_thenSuccess() throws Exception {

      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );
      String givenResourceId = performBpnCreateRequest( toJson( givenPayLoad ) );

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .delete( BPN_DISCOVERY_BASE_PATH + "/{givenResourceId}", givenResourceId )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .with( testJwtTokenFactory.deleteBpnDiscoveryEndpoints() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isNoContent() );
   }

   @Test
   public void givenAuthenticationTokenWithoutResourceAccess_whenSearch_thenReturnForbidden() throws Exception {

      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );
      performBpnCreateRequest( toJson( givenPayLoad ) );

      String givenSearchFilter = "{\"searchFilter\": [{\"type\":\"oen\",\"keys\": [\"oen-133\"]}]}";

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_SEARCH_API )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( givenSearchFilter )
                        .with( testJwtTokenFactory.withoutResourceAccess() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isForbidden() );

   }

   @Test
   public void givenAuthenticationTokenWithoutRoles_whenSearch_thenReturnForbidden() throws Exception {

      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );
      performBpnCreateRequest( toJson( givenPayLoad ) );

      String givenSearchFilter = "{\"searchFilter\": [{\"type\":\"oen\",\"keys\": [\"oen-133\"]}]}";

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_SEARCH_API )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( givenSearchFilter )
                        .with( testJwtTokenFactory.noRolesNoBpn() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isForbidden() );

   }

   @Test
   public void givenNoAuthenticationToken_whenSearch_thenReturnUnauthorized() throws Exception {

      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );
      performBpnCreateRequest( toJson( givenPayLoad ) );

      String givenSearchFilter = "{\"searchFilter\": [{\"type\":\"oen\",\"keys\": [\"oen-133\"]}]}";

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_SEARCH_API )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( givenSearchFilter )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isUnauthorized() );

   }

   @Test
   public void givenAuthentication_missingBpnClaim_whenAdding_thenReturnForbidden() throws Exception {
      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_BASE_PATH )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( toJson( givenPayLoad ) )
                        .with( testJwtTokenFactory.allRolesNoBpnClaim() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isForbidden() );

   }

   @Test
   public void givenAuthentication_BpnClaimIsNull_whenAdding_thenReturnForbidden() throws Exception {
      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_BASE_PATH )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( toJson( givenPayLoad ) )
                        .with( testJwtTokenFactory.allRolesBpnClaimNull() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isForbidden() );

   }

   @Test
   public void givenAuthentication_allRolesWrongBpn_whenDeleting_thenReturnBadRequest() throws Exception {
      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );
      String givenResourceId = performBpnCreateRequest( toJson( givenPayLoad ) );

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .delete( BPN_DISCOVERY_BASE_PATH + "/{givenResourceId}", givenResourceId )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .with( testJwtTokenFactory.withAllRolesWrongBpn() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isBadRequest() )
            .andExpect( jsonPath( "$.error.message", is( "Not Authorized! The given Bpn bpn-123 is not valid." ) ) );

   }

   @Test
   public void givenAuthentication_noDeleteRoleWrongBpn_whenDeleting_thenReturnForbidden() throws Exception {
      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );
      String givenResourceId = performBpnCreateRequest( toJson( givenPayLoad ) );

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .delete( BPN_DISCOVERY_BASE_PATH + "/{givenResourceId}", givenResourceId )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .with( testJwtTokenFactory.searchBpnDiscoveryEndpoints_differentBpn() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isForbidden() );

   }

   @Test
   public void givenAuthentication_allRolesBpnClaimEmpty_whenSaving_thenReturnBadRequest() throws Exception {
      //given
      ObjectNode givenPayLoad = createTypeKeyPayLoad( "oen", "oen-133" );

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_BASE_PATH )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( toJson( givenPayLoad ) )
                        .with( testJwtTokenFactory.withAllRolesNoBpn() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isBadRequest() )
            .andExpect( jsonPath( "$.error.message", is( "Validation failed." ) ) );
   }

}
