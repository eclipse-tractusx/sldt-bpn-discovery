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

import org.eclipse.tractusx.bpndiscovery.BpnDiscoveryProperties;
import org.eclipse.tractusx.bpndiscovery.security.validator.JwtBpnIdClaimValidator;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.security.oauth2.resource.OAuth2ResourceServerProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.oauth2.core.DelegatingOAuth2TokenValidator;
import org.springframework.security.oauth2.core.OAuth2TokenValidator;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.jwt.JwtDecoders;
import org.springframework.security.oauth2.jwt.JwtValidators;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.security.web.SecurityFilterChain;

@Profile( "!local" )
@Configuration
public class OAuthConfig {

   @Bean
   protected SecurityFilterChain configure( HttpSecurity http, JwtAuthenticationConverter jwtAuthenticationConverter ) throws Exception {
      http
            .authorizeHttpRequests( authorize -> authorize
                  .requestMatchers( HttpMethod.OPTIONS ).permitAll()

                  .requestMatchers( HttpMethod.GET, "/**" ).permitAll()

                  .requestMatchers( HttpMethod.POST, "/api/v1.0/administration/connectors/bpnDiscovery/batch" )
                  .hasRole( JwtRoles.ADD.getRole() )

                  .requestMatchers( HttpMethod.POST, "/api/v1.0/administration/connectors/bpnDiscovery/search" )
                  .hasRole( JwtRoles.VIEW.getRole() )

                  .requestMatchers( HttpMethod.DELETE, "/api/v1.0/administration/connectors/bpnDiscovery/**" )
                  .hasRole( JwtRoles.DELETE.getRole() )

                  .requestMatchers( HttpMethod.POST, "/api/v1.0/administration/connectors/bpnDiscovery" )
                  .hasRole( JwtRoles.ADD.getRole() )

            )
            .csrf().disable()
            .sessionManagement().sessionCreationPolicy( SessionCreationPolicy.STATELESS )
            .and()
            .oauth2ResourceServer( oauth2 -> oauth2
                  .jwt( jwt -> jwt
                        .jwtAuthenticationConverter( jwtAuthenticationConverter ) ) );
      return http.build();
   }

   @Bean
   public JwtAuthenticationConverter jwtAuthenticationConverter( BpnDiscoveryProperties bpnDiscoveryProperties ) {
      final JwtAuthenticationConverter converter = new JwtAuthenticationConverter();
      converter.setJwtGrantedAuthoritiesConverter( new JwtConverter( bpnDiscoveryProperties.getIdm().getPublicClientId() ) );
      return converter;
   }

   @Bean
   @ConditionalOnMissingBean
   public JwtDecoder jwtDecoder( BpnDiscoveryProperties bpnDiscoveryProperties,
         OAuth2ResourceServerProperties oauth2Props ) {
      String issuerUri = oauth2Props.getJwt().getIssuerUri();
      NimbusJwtDecoder jwtDecoder = JwtDecoders.fromIssuerLocation( issuerUri );
      OAuth2TokenValidator<Jwt> defaultIssuer = JwtValidators.createDefaultWithIssuer( issuerUri );
      OAuth2TokenValidator<Jwt> bpnIdValidator = new JwtBpnIdClaimValidator( bpnDiscoveryProperties.getIdm().getBpnIdClaimName() );
      jwtDecoder.setJwtValidator( new DelegatingOAuth2TokenValidator<>( defaultIssuer, bpnIdValidator ) );
      return jwtDecoder;
   }

   @Bean
   public BpnAuthorizationEvaluator authorizationEvaluator( BpnDiscoveryProperties bpnDiscoveryProperties ) {
      return new BpnAuthorizationEvaluator( bpnDiscoveryProperties.getIdm().getBpnIdClaimName() );
   }

}
