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

import static org.hamcrest.Matchers.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.assertj.core.api.Assertions;
import org.eclipse.tractusx.bpndiscovery.AbstractBpnDiscoveryApiTest;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;

import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

public class BpnDiscoveryApiDelegateTest extends AbstractBpnDiscoveryApiTest {

   @BeforeEach
   public void cleanUp() {
      bpnDiscoveryRepository.deleteAll();
   }

   @Test
   public void givenValidBpnDiscovery_whenSave_thenSaveSucceeds() throws Exception {
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
            .andExpect( status().isCreated() )
            .andExpect( content().json( toJson( givenPayLoad ) ) );
   }

   @Test
   public void givenNotAllowedType_whenSave_thenValidationFailed() throws Exception {
      //given
      ObjectNode givenInvalidPayLoad = createTypeKeyPayLoad( "bpn", "oen-124" );

      //when -> then
      mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_BASE_PATH )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( toJson( givenInvalidPayLoad ) )
                        .with( testJwtTokenFactory.allRoles_andBpn() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isBadRequest() )
            .andExpect( jsonPath( "$.error.message", is( "Validation failed." ) ) );
   }

   @Test
   public void givenValidBpnDiscoveries_whenBatchSave_thenSaveSucceeds() throws Exception {
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
            .andExpect( status().isCreated() )
            .andExpect( content().string( containsString( "BpnDiscovery successfully created" ) ) );
   }

   @Test
   public void givenNotAllowedType_whenBatchSave_thenResultIncludesValidationFailed() throws Exception {
      //given
      ObjectNode givenInvalidNode1 = createTypeKeyPayLoad( "bpmn", "oen-123" );
      ObjectNode givenValidOenNode2 = createTypeKeyPayLoad( "oen", "oen-137" );
      ArrayNode givenPayload = mapper.createArrayNode()
            .add( givenInvalidNode1 )
            .add( givenValidOenNode2 );

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
            .andExpect( jsonPath( "$[0].status", is( 400 ) ) )
            .andExpect( content().string( containsString( "type bpmn is not allowed." ) ) )
            .andExpect( status().isCreated() );
   }

   @Test
   public void givenDuplicates_whenBatchSave_thenResultIncludesValidationFailed() throws Exception {
      //given
      ObjectNode givenInvalidNode1 = createTypeKeyPayLoad( "oen", "oen-123" );
      ObjectNode givenInvalidNode2 = createTypeKeyPayLoad( "oen", "oen-123" );
      ObjectNode givenValidOenNode = createTypeKeyPayLoad( "oen", "oen-137" );
      ArrayNode givenPayload = mapper.createArrayNode()
            .add( givenInvalidNode1 )
            .add( givenInvalidNode2 )
            .add( givenValidOenNode );

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
            .andExpect( content().string( containsString( "duplicated entity. Key type combination exists." ) ) )
            .andExpect( status().isCreated() );
   }

   @Test
   public void givenSearchFilter_whenGetBpnDiscoveries_thenReturnResult() throws Exception {
      //given
      ObjectNode givenOenNode1 = createTypeKeyPayLoad( "oen", "oen-138" );
      ObjectNode givenOenNode2 = createTypeKeyPayLoad( "oen", "oen-139" );
      performBpnCreateRequest( toJson( givenOenNode1 ) );
      performBpnCreateRequest( toJson( givenOenNode2 ) );

      String givenSearchFilter = "{\"searchFilter\": [{\"type\":\"oen\",\"keys\": [\"oen-138\", \"oen-139\"]}]}";

      // when -> then
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
   public void givenSearchFilterWithDuplicateEntries_whenGetBpnDiscoveries_thenReturnSingleResult() throws Exception {
      //given
      ObjectNode givenOenNode1 = createTypeKeyPayLoad( "oen", "oen-141" );
      ObjectNode givenOenNode2 = createTypeKeyPayLoad( "oen", "oen-142" );
      performBpnCreateRequest( toJson( givenOenNode1 ) );
      performBpnCreateRequest( toJson( givenOenNode2 ) );

      String givenSearchFilter =
            "{\"searchFilter\": [{\"type\":\"oen\",\"keys\": [\"oen-141\", \"oen-142\"]}, {\"type\":\"oen\",\"keys\": [\"oen-141\", \"oen-142\"]}]}";

      // when
      MvcResult result = mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_SEARCH_API )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( givenSearchFilter )
                        .with( testJwtTokenFactory.allRoles_andBpn() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isOk() )
            .andReturn();

      // then
      String response = result.getResponse().getContentAsString();
      Assertions.assertThat( response ).containsOnlyOnce( "oen-141" );
      Assertions.assertThat( response ).containsPattern( "(resourceId.*?){2}" );

   }

   @Test
   public void givenValidResourceId_whenDelete_thenDeleteSucceeds() throws Exception {
      // given
      ObjectNode givenCreatedOenNode = createTypeKeyPayLoad( "oen", "oen-140" );
      String givenResourceId = performBpnCreateRequest( toJson( givenCreatedOenNode ) );

      // when -> then
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
   public void givenInvalidResourceId_whenDelete_thenThrowEntityNotFoundException() throws Exception {
      // given
      String givenInvalidResourceId = "338f797a-bbfd-11ed-afa1-0242ac120002";

      // when -> then

      mockMvc.perform(
                  MockMvcRequestBuilders
                        .delete( BPN_DISCOVERY_BASE_PATH + "/{givenResourceId}", givenInvalidResourceId )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .with( testJwtTokenFactory.allRoles_andBpn() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isNotFound() )
            .andExpect( jsonPath( "$.error.message", is( String.format( "BpnDiscovery for the resourceId %s not found.", givenInvalidResourceId ) ) ) );
   }

   @Test
   public void givenInvalidResourceIdFormat_whenDelete_thenValidationThrowException() throws Exception {

      //given
      String givenInvalidResourceIdFormat = "invalid-uuid-338f797a-bbfd-11ed-afa1-0242ac120002";

      mockMvc.perform(
                  MockMvcRequestBuilders
                        .delete( BPN_DISCOVERY_BASE_PATH + "/{givenResourceId}", givenInvalidResourceIdFormat )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .with( testJwtTokenFactory.allRoles_andBpn() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isBadRequest() )
            .andExpect( jsonPath( "$.error.message", is( "Validation failed." ) ) );

   }

}
