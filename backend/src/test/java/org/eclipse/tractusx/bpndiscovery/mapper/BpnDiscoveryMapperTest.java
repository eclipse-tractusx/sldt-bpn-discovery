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
import java.util.UUID;

import org.assertj.core.api.Assertions;
import org.eclipse.tractusx.bpndiscovery.dto.BatchResultDto;
import org.eclipse.tractusx.bpndiscovery.dto.TypeKeysIdentifierDto;
import org.eclipse.tractusx.bpndiscovery.model.Bpn;
import org.eclipse.tractusx.bpndiscovery.model.BpnDiscovery;
import org.eclipse.tractusx.bpndiscovery.model.IdentifierTypeKeyPair;
import org.eclipse.tractusx.bpndiscovery.model.SearchIdentifierTypeKeyPair;
import org.eclipse.tractusx.bpndiscovery.model.TypeKeyPairBatchResult;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpStatus;

public class BpnDiscoveryMapperTest {

   private final BpnDiscoveryMapper bpnDiscoveryMapper = new BpnDiscoveryMapperImpl();

   @Test
   public void fromApiDto() {
      //given
      IdentifierTypeKeyPair testApiDto = new IdentifierTypeKeyPair().key( "oen-123" ).type( "oen" );

      //when
      BpnDiscovery actualDiscovery = bpnDiscoveryMapper.fromApiDto( testApiDto );

      //then
      Assertions.assertThat( actualDiscovery ).isInstanceOf( BpnDiscovery.class );
      Assertions.assertThat( actualDiscovery.getKey() ).isEqualTo( "oen-123" );
      Assertions.assertThat( actualDiscovery.getType() ).isEqualTo( "oen" );
      Assertions.assertThat( actualDiscovery.getResourceId() ).isNotNull();
   }

   @Test
   public void fromApiDto_Null() {
      //given null -> when
      BpnDiscovery actualDiscovery = bpnDiscoveryMapper.fromApiDto( null );

      //then
      Assertions.assertThat( actualDiscovery ).isNull();
   }

   @Test
   public void toApiDto() {
      //given
      UUID givenUuid = UUID.randomUUID();
      UUID givenResourceID = UUID.randomUUID();
      BpnDiscovery givenBpn = new BpnDiscovery( givenUuid, "oen", "oen-123", "DEFAULT_BPN", givenResourceID );

      //when
      Bpn actualBpn = bpnDiscoveryMapper.toApiDto( givenBpn );

      //then
      Assertions.assertThat( actualBpn.getResourceId().toString() ).isEqualTo( givenResourceID.toString() );
      Assertions.assertThat( actualBpn.getType() ).isEqualTo( "oen" );
      Assertions.assertThat( actualBpn.getValue() ).isEqualTo( "DEFAULT_BPN" );
   }

   @Test
   public void toApiDto_Null() {
      //given
      BpnDiscovery givenBpn = null;

      //when
      Bpn actualBpn = bpnDiscoveryMapper.toApiDto( givenBpn );

      //then
      Assertions.assertThat( actualBpn ).isNull();
   }

   @Test
   public void fromListApiDto() {
      //given
      IdentifierTypeKeyPair identifierTypeKeyPair1 = new IdentifierTypeKeyPair().type( "oen" ).key( "oen-123" );
      IdentifierTypeKeyPair identifierTypeKeyPair2 = new IdentifierTypeKeyPair().type( "oen" ).key( "oen-126" );

      List<IdentifierTypeKeyPair> givenIdentfierTypeKeyPairs = List.of( identifierTypeKeyPair1, identifierTypeKeyPair2 );

      //when
      List<BpnDiscovery> actualBpnDiscoveries = bpnDiscoveryMapper.fromListApiDto( givenIdentfierTypeKeyPairs );

      //then
      Assertions.assertThat( actualBpnDiscoveries ).hasSize( 2 );
      Assertions.assertThat( actualBpnDiscoveries.get( 0 ).getType() ).isEqualTo( "oen" );
      Assertions.assertThat( actualBpnDiscoveries.get( 0 ).getKey() ).isEqualTo( "oen-123" );
      Assertions.assertThat( actualBpnDiscoveries.get( 1 ).getResourceId() ).isNotNull();
   }

   @Test
   public void fromListApiDto_Null() {
      //given null -> when
      List<BpnDiscovery> actualBpnDiscoveries = bpnDiscoveryMapper.fromListApiDto( null );

      //then
      Assertions.assertThat( actualBpnDiscoveries ).isNull();
   }

   @Test
   public void toListApiDto() {
      //given
      BatchResultDto givenResultDto1 = new BatchResultDto( "BpnDiscovery successfully created", null, "oen-123", HttpStatus.OK.value() );
      BatchResultDto givenResultDto2 = new BatchResultDto( "Validation failed.", null, "oen-124", HttpStatus.BAD_REQUEST.value() );
      List<BatchResultDto> givenBatchResultDto = List.of( givenResultDto1, givenResultDto2 );

      //when
      List<TypeKeyPairBatchResult> actuaBatchResults = bpnDiscoveryMapper.toListApiDto( givenBatchResultDto );

      //then
      TypeKeyPairBatchResult batchResult1 = actuaBatchResults.get( 0 );
      TypeKeyPairBatchResult batchResult2 = actuaBatchResults.get( 1 );

      Assertions.assertThat( actuaBatchResults ).hasSize( 2 );

      Assertions.assertThat( batchResult1.getKey() ).isEqualTo( givenResultDto1.getKey() );
      Assertions.assertThat( batchResult1.getMessage() ).isEqualTo( givenResultDto1.getMessage() );
      Assertions.assertThat( batchResult1.getStatus() ).isEqualTo( givenResultDto1.getStatus() );

      Assertions.assertThat( batchResult2.getKey() ).isEqualTo( givenResultDto2.getKey() );
      Assertions.assertThat( batchResult2.getMessage() ).isEqualTo( givenResultDto2.getMessage() );
      Assertions.assertThat( batchResult2.getStatus() ).isEqualTo( givenResultDto2.getStatus() );
   }

   @Test
   public void toListApiDto_Null() {
      //given -> when
      List<TypeKeyPairBatchResult> actualResults = bpnDiscoveryMapper.toListApiDto( null );

      //then
      Assertions.assertThat( actualResults ).isNull();
   }

   @Test
   public void fromSearchApiDto() {
      //given
      SearchIdentifierTypeKeyPair givenSearchIdentifierTypeKeyPair = new SearchIdentifierTypeKeyPair().type( "oen" )
            .keys( List.of( "oen-123", "oen-133", "oen-100" ) );

      //when
      List<TypeKeysIdentifierDto> actualIdentifierDto = bpnDiscoveryMapper.fromSearchListApiDto( List.of( givenSearchIdentifierTypeKeyPair ) );

      //then
      Assertions.assertThat( actualIdentifierDto ).hasSize( 1 );
      Assertions.assertThat( actualIdentifierDto.get( 0 ).getKeys() ).hasSize( 3 );
      Assertions.assertThat( actualIdentifierDto.get( 0 ).getKeys().get( 1 ) ).isEqualTo( "oen-133" );
   }

   @Test
   public void fromSearchApiDto_Null() {

      //given -> when
      List<TypeKeysIdentifierDto> actualIdentifierDto = bpnDiscoveryMapper.fromSearchListApiDto( null );

      //then
      Assertions.assertThat( actualIdentifierDto ).isNull();
   }

   @Test
   public void fromSearchListApiDto() {
      //given
      SearchIdentifierTypeKeyPair givenSearchIdentifierTypeKeyPair1 = new SearchIdentifierTypeKeyPair().type( "oen" )
            .keys( List.of( "oen-123", "oen-133", "oen-100" ) );

      SearchIdentifierTypeKeyPair givenSearchIdentifierTypeKeyPair2 = new SearchIdentifierTypeKeyPair().type( "bpid" )
            .keys( List.of( "bpid-123", "bpid-133", "bpid-100" ) );

      List<SearchIdentifierTypeKeyPair> searchIdentifierTypeKeyPairs = List.of( givenSearchIdentifierTypeKeyPair1, givenSearchIdentifierTypeKeyPair2 );

      //when
      List<TypeKeysIdentifierDto> actualTypeKeysDtoList = bpnDiscoveryMapper.fromSearchListApiDto( searchIdentifierTypeKeyPairs );

      //then
      Assertions.assertThat( actualTypeKeysDtoList ).hasSize( 2 );
      Assertions.assertThat( actualTypeKeysDtoList.get( 0 ).getType() ).isEqualTo( "oen" );
      Assertions.assertThat( actualTypeKeysDtoList.get( 1 ).getType() ).isEqualTo( "bpid" );

   }

   @Test
   public void fromSearchListApiDto_Null() {

      //given null -> when
      List<TypeKeysIdentifierDto> actualTypeKeysDtoList = bpnDiscoveryMapper.fromSearchListApiDto( null );

      //then
      Assertions.assertThat( actualTypeKeysDtoList ).isNull();
   }
}
