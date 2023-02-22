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

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.jwt;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors;
import org.springframework.test.web.servlet.request.RequestPostProcessor;

import net.minidev.json.JSONArray;

public class TestJwtTokenFactory {

   private final BpnOwner bpnOwner;

   public TestJwtTokenFactory( String publicClientId, String bpn ) {
      this.bpnOwner = new BpnOwner( publicClientId, bpn );
   }

   public RequestPostProcessor allRoles_andBpn() {
      return bpnOwner.allRoles_andBpn();
   }
   
   public RequestPostProcessor searchBpnDiscoveryEndpoints_differentBpn() {
      return bpnOwner.searchBpnDiscoveryEndpoints_differentBpn();
   }

   public RequestPostProcessor searchBpnDiscoveryEndpoints() {
      return bpnOwner.searchBpnDiscoveryEndpoints();
   }

   public RequestPostProcessor addBpnDiscoveryEndpoints() {
      return bpnOwner.addBpnDiscoveryEndpoints();
   }

   public RequestPostProcessor deleteBpnDiscoveryEndpoints() {
      return bpnOwner.deleteBpnDiscoveryEndpoints();
   }

   public RequestPostProcessor withoutResourceAccess() {
      return bpnOwner.withoutResourceAccess();
   }

   public RequestPostProcessor withAllRolesWrongBpn() {
      return bpnOwner.withAllRolesWrongBpn();
   }

   public RequestPostProcessor withAllRolesNoBpn() {
      return bpnOwner.withAllRolesNoBpn();
   }

   public RequestPostProcessor noRolesNoBpn() {
      return bpnOwner.withoutRolesNoBpn();
   }

   public RequestPostProcessor allRolesNoBpnClaim() {
      return bpnOwner.allRolesNoBpnClaim();
   }

   public RequestPostProcessor allRolesBpnClaimNull() {
      return bpnOwner.allRolesBpnClaimNull();
   }

   public class BpnOwner {

      String publicClientId;

      String bpn;

      JwtConverter jwtConverter;

      public BpnOwner( String publicClientId, String bpn ) {
         this.publicClientId = publicClientId;
         this.bpn = bpn;
         this.jwtConverter = new JwtConverter( publicClientId );
      }

      public RequestPostProcessor allRoles_andBpn() {
         return authenticationWithRolesAndBpn( List.of( JwtRoles.DELETE.getRole(), JwtRoles.ADD.getRole(), JwtRoles.VIEW.getRole() )
               , bpn );
      }

      public RequestPostProcessor withAllRolesWrongBpn() {
         String wrongBpn = "bpn-123";
         return authenticationWithRolesAndBpn( List.of( JwtRoles.DELETE.getRole(), JwtRoles.ADD.getRole(), JwtRoles.VIEW.getRole() ), wrongBpn );
      }

      public RequestPostProcessor withAllRolesNoBpn() {
         String wrongBpn = "";
         return authenticationWithRolesAndBpn( List.of( JwtRoles.DELETE.getRole(), JwtRoles.ADD.getRole(), JwtRoles.VIEW.getRole() ), wrongBpn );
      }

      public RequestPostProcessor searchBpnDiscoveryEndpoints_differentBpn() {
         String givenBpn = "bpn-133";
         return authenticationWithRolesAndBpn( List.of( JwtRoles.VIEW.getRole() ), givenBpn );
      }

      public RequestPostProcessor searchBpnDiscoveryEndpoints() {
         return authenticationWithRolesAndBpn( List.of( JwtRoles.VIEW.getRole() ), bpn );
      }

      public RequestPostProcessor addBpnDiscoveryEndpoints() {
         return authenticationWithRolesAndBpn( List.of( JwtRoles.ADD.getRole() ), bpn );
      }

      public RequestPostProcessor deleteBpnDiscoveryEndpoints() {
         return authenticationWithRolesAndBpn( List.of( JwtRoles.DELETE.getRole() ), bpn );
      }

      public SecurityMockMvcRequestPostProcessors.JwtRequestPostProcessor withoutResourceAccess() {
         Jwt jwtToken = Jwt.withTokenValue( "token" )
               .header( "alg", "none" )
               .claim( "sub", "user" )
               .claim( "bpn", "" )
               .build();
         return jwt().jwt( jwtToken ).authorities( jwtConverter );
      }

      public SecurityMockMvcRequestPostProcessors.JwtRequestPostProcessor withoutRolesNoBpn() {
         Jwt jwtToken = Jwt.withTokenValue( "token" )
               .header( "alg", "none" )
               .claim( "sub", "user" )
               .claim( "resource_access", Map.of( publicClientId, new HashMap<String, String>() ) )
               .claim( "bpn", "" )
               .build();
         return jwt().jwt( jwtToken ).authorities( jwtConverter );
      }

      public SecurityMockMvcRequestPostProcessors.JwtRequestPostProcessor allRolesNoBpnClaim() {
         Jwt jwtToken = Jwt.withTokenValue( "token" )
               .header( "alg", "none" )
               .claim( "sub", "user" )
               .claim( "resource_access", Map.of( publicClientId, new HashMap<String, String>() ) )
               .build();
         return jwt().jwt( jwtToken ).authorities( jwtConverter );
      }

      public SecurityMockMvcRequestPostProcessors.JwtRequestPostProcessor allRolesBpnClaimNull() {
         Jwt jwtToken = Jwt.withTokenValue( "token" )
               .header( "alg", "none" )
               .claim( "sub", "user" )
               .claim( "resource_access", Map.of( publicClientId, new HashMap<String, String>() ) )
               .claim( "bpn", null )
               .build();
         return jwt().jwt( jwtToken ).authorities( jwtConverter );
      }

      private SecurityMockMvcRequestPostProcessors.JwtRequestPostProcessor authenticationWithRolesAndBpn( List<String> roles, String bpn ) {
         Jwt jwtToken = Jwt.withTokenValue( "token" )
               .header( "alg", "none" )
               .claim( "sub", "user" )
               .claim( "resource_access", Map.of( publicClientId, Map.of( "roles", toJsonArray( roles ) ) ) )
               .claim( "bpn", bpn )
               .build();
         return jwt().jwt( jwtToken ).authorities( jwtConverter );
      }

      private static JSONArray toJsonArray( List<String> elements ) {
         JSONArray jsonArray = new JSONArray();
         for ( String element : elements ) {
            jsonArray.appendElement( element );
         }
         return jsonArray;
      }

   }

}
