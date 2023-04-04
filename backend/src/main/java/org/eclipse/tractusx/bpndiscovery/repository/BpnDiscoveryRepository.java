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
package org.eclipse.tractusx.bpndiscovery.repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.eclipse.tractusx.bpndiscovery.model.BpnDiscovery;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BpnDiscoveryRepository extends CrudRepository<BpnDiscovery, UUID> {

   Optional<BpnDiscovery> findBpnDiscoveryByResourceId( String resourceId );

   List<BpnDiscovery> findBpnDiscoveriesByTypeAndKeyIn( String type, List<String> keys );
}
