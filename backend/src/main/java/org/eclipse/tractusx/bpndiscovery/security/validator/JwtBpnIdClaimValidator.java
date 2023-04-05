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
package org.eclipse.tractusx.bpndiscovery.security.validator;

import java.util.function.Predicate;

import org.springframework.security.oauth2.core.OAuth2TokenValidator;
import org.springframework.security.oauth2.core.OAuth2TokenValidatorResult;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.jwt.JwtClaimValidator;
import org.springframework.util.Assert;

/**
 Validates the configurable bpnId claim name in a Jwt.
 The validator ensures that the Jwt contains the claim and that it's value is not blank.
 */

public class JwtBpnIdClaimValidator implements OAuth2TokenValidator<Jwt> {

   private final JwtClaimValidator<Object> validator;

   /**
    * @param bpnIdClaimName - The claim name of the bpn id that each {@link Jwt} should have.
    */
   public JwtBpnIdClaimValidator( String bpnIdClaimName ) {
      Assert.notNull( bpnIdClaimName, "bpnId claim name cannot be null!" );
      Predicate<Object> testClaimValue = ( claimValue ) -> {
         if ( claimValue == null ) {
            return false;
         }
         if ( !(claimValue instanceof String) ) {
            return false;
         }
         return !((String) claimValue).isBlank();
      };
      this.validator = new JwtClaimValidator<>( bpnIdClaimName, testClaimValue );
   }

   @Override
   public OAuth2TokenValidatorResult validate( Jwt token ) {
      Assert.notNull( token, "token cannot be null" );
      return this.validator.validate( token );
   }
}
