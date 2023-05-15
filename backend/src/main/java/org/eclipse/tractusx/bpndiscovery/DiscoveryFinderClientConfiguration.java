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

import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.client.AuthorizedClientServiceOAuth2AuthorizedClientManager;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientManager;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientProvider;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientProviderBuilder;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.web.reactive.function.client.ServletOAuth2AuthorizedClientExchangeFilterFunction;
import org.springframework.web.reactive.function.client.WebClient;

@Configuration
@EnableConfigurationProperties( DiscoveryFinderClientProperties.class )
public class DiscoveryFinderClientConfiguration {

   @Bean
   WebClient webClient( OAuth2AuthorizedClientManager auth2AuthorizedClientManager, DiscoveryFinderClientProperties discoveryFinderProperties ) {

      ServletOAuth2AuthorizedClientExchangeFilterFunction oauth = new ServletOAuth2AuthorizedClientExchangeFilterFunction( auth2AuthorizedClientManager );
      oauth.setDefaultClientRegistrationId( "discoveryfinder-client" );
      return WebClient.builder().baseUrl( discoveryFinderProperties.getBaseUrl() ).apply( oauth.oauth2Configuration() ).build();
   }

   @Bean
   OAuth2AuthorizedClientManager auth2AuthorizedClientManager( ClientRegistrationRepository clientRegistrationRepository,
         OAuth2AuthorizedClientService oAuth2AuthorizedClientService ) {

      OAuth2AuthorizedClientProvider auth2AuthorizedClientProvider = OAuth2AuthorizedClientProviderBuilder.builder()
            .authorizationCode().refreshToken().clientCredentials().build();

      AuthorizedClientServiceOAuth2AuthorizedClientManager authorizedClientManager =
            new AuthorizedClientServiceOAuth2AuthorizedClientManager( clientRegistrationRepository, oAuth2AuthorizedClientService );

      authorizedClientManager.setAuthorizedClientProvider( auth2AuthorizedClientProvider );

      return authorizedClientManager;
   }
}
