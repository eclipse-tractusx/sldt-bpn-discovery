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
package org.eclipse.tractusx.bpndiscovery.service.validator;

import java.util.HashMap;

import org.eclipse.tractusx.bpndiscovery.BpnDiscoveryProperties;
import org.eclipse.tractusx.bpndiscovery.model.BpnDiscovery;
import org.eclipse.tractusx.bpndiscovery.service.exception.ValidationException;
import org.springframework.stereotype.Component;

@Component
public class BpnDiscoveryValidator {
   private final BpnDiscoveryProperties bpnDiscoveryProperties;

   public BpnDiscoveryValidator( BpnDiscoveryProperties bpnDiscoveryProperties ) {
      this.bpnDiscoveryProperties = bpnDiscoveryProperties;
   }

   public void validate( BpnDiscovery bpnDiscovery ) {
      HashMap<String, Object> violations = new HashMap<>();
      if ( bpnDiscovery.getValue() == null || bpnDiscovery.getValue().isEmpty() ) {
         violations.put( "bpn", "bpn value must not be null or empty." );
      }
      if ( bpnDiscovery.getType() == null || !bpnDiscoveryProperties.getAllowedTypes().contains( bpnDiscovery.getType() ) ) {
         violations.put( "type", String.format( "type %s is not allowed.", bpnDiscovery.getType() ) );
      }
      if ( bpnDiscovery.getKey() == null || bpnDiscovery.getKey().isEmpty() ) {
         violations.put( "key", "key must not be null or empty." );
      }

      if ( !violations.isEmpty() ) {
         throw new ValidationException( "Validation failed.", violations );
      }
   }
}
