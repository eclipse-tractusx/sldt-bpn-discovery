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
package org.eclipse.tractusx.bpndiscovery.mapper;

import java.util.List;

import org.eclipse.tractusx.bpndiscovery.dto.BatchResultDto;
import org.eclipse.tractusx.bpndiscovery.dto.BpnDiscoveryCollectionDto;
import org.eclipse.tractusx.bpndiscovery.dto.TypeKeysIdentifierDto;
import org.eclipse.tractusx.bpndiscovery.model.Bpn;
import org.eclipse.tractusx.bpndiscovery.model.BpnCollection;
import org.eclipse.tractusx.bpndiscovery.model.BpnDiscovery;
import org.eclipse.tractusx.bpndiscovery.model.IdentifierTypeKeyPair;
import org.eclipse.tractusx.bpndiscovery.model.SearchIdentifierTypeKeyPair;
import org.eclipse.tractusx.bpndiscovery.model.TypeKeyPairBatchResult;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper( uses = { BpnDiscovery.class }, componentModel = "spring", injectionStrategy = InjectionStrategy.CONSTRUCTOR )
public interface BpnDiscoveryMapper {
   @Mapping( target = "resourceId", expression = "java(UUID.randomUUID())" )
   BpnDiscovery fromApiDto( IdentifierTypeKeyPair apiDto );

   List<BpnDiscovery> fromListApiDto( List<IdentifierTypeKeyPair> identifierTypeKeyPair );

   List<TypeKeysIdentifierDto> fromSearchListApiDto( List<SearchIdentifierTypeKeyPair> searchIdentifierTypeKeyPairs );

   Bpn toApiDto( BpnDiscovery bpnDiscovery );

   List<TypeKeyPairBatchResult> toListApiDto( List<BatchResultDto> bpnDiscovery );

   BpnCollection toApiDto( BpnDiscoveryCollectionDto bpns );

}
