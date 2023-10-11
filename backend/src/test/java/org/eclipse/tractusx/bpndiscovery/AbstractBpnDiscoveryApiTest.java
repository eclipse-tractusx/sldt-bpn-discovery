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
package org.eclipse.tractusx.bpndiscovery;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.eclipse.tractusx.bpndiscovery.repository.BpnDiscoveryRepository;
import org.eclipse.tractusx.bpndiscovery.security.TestJwtTokenFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

@SpringBootTest
@AutoConfigureMockMvc
@EnableConfigurationProperties( BpnDiscoveryProperties.class )
public abstract class AbstractBpnDiscoveryApiTest {

   protected static final String BPN_DISCOVERY_BASE_PATH = "/api/v1.0/administration/connectors/bpnDiscovery";
   protected static final String BPN_DISCOVERY_BATCH_API = "/api/v1.0/administration/connectors/bpnDiscovery/batch";
   protected static final String BPN_DISCOVERY_SEARCH_API = "/api/v1.0/administration/connectors/bpnDiscovery/search";

   @Autowired
   protected MockMvc mockMvc;

   @Autowired
   protected ObjectMapper mapper;

   @Autowired
   protected TestJwtTokenFactory testJwtTokenFactory;

   @Autowired
   protected BpnDiscoveryRepository bpnDiscoveryRepository;

   protected ObjectNode createTypeKeyPayLoad( String type, String key ) {
      ObjectNode requestNode = mapper.createObjectNode();
      requestNode.put( "type", type );
      requestNode.put( "key", key );
      return requestNode;
   }
   
   protected String toJson( ObjectNode objectNode ) throws JsonProcessingException {
      return mapper.writeValueAsString( objectNode );
   }

   protected String toJson( ArrayNode objectNode ) throws JsonProcessingException {
      return mapper.writeValueAsString( objectNode );
   }

   protected String performBpnCreateRequest( String requestToJson ) throws Exception {
      MvcResult result = mockMvc.perform(
                  MockMvcRequestBuilders
                        .post( BPN_DISCOVERY_BASE_PATH )
                        .accept( MediaType.APPLICATION_JSON )
                        .contentType( MediaType.APPLICATION_JSON )
                        .content( requestToJson )
                        .with( testJwtTokenFactory.allRoles_andBpn() )
            )
            .andDo( MockMvcResultHandlers.print() )
            .andExpect( status().isCreated() )
            .andReturn();

      String sResult = result.getResponse().getContentAsString();
      String resourceID = sResult.substring( sResult.lastIndexOf( ":" ) );
      resourceID = resourceID.replace( "\"}", "" ).replace( ":\"", "" ).trim();

      return resourceID;
   }

}
