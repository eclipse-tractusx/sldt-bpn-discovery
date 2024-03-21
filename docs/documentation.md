# Developer Documentation Tractus-X BPN Discovery

This page provides an overview of the BPN Discovery.

## Architectural Overview
The Digital Twins are no longer administrated in a central registry. The implementation of two services, "Discovery Finder" and "BPN
Discovery", ensures that EDCs still can be found in the decentralized environment.
The BPN Discovery hereby is responsible to send BPNs for a given type / key combination e.g. for "oen"s.

![](media/OverallConcept.png)

## Actors
There are two actors who interact with this service.

| Actor         | Description                                                                                   | Example                                                       |
|---------------|-----------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| Data Consumer | The Data Consumer uses the BPN Discovery to search for BPN of a given type / key combination. | A consumer searches for a BPN for type "oen" / key "123-oen". |
| Data Provider | The Data Provider adds or deletes his type / key combinations for his BPN.                    | A provider add a type "oen" / key "123-oen" under his BPN.    |
| Keycloak      | Keycloak is used for token validation                                                         |                                                               |

## BPN Discovery Api
The BPN Discovery provides a Swagger-Interface for all endpoints: https://semantics.int.demo.catena-x.net/bpndiscovery/swagger-ui/index.html

## Authentication & Authorization
The service is secured by a OAuth2 compliant authorization. Every API call has to provide a
valid Bearer Token. Authorization is provided by a role based access. These roles are possible:

| Role                      | Description                            |
|---------------------------|----------------------------------------|
| view_discovery_endpoint   | can search for BPN Discovery endpoints |
| add_discovery_endpoint    | can add BPN Discovery endpoints        |
| delete_discovery_endpoint | can delete BPN Discovery endpoints     |

The Bearer Token also provide a claim with the BPN. This BPN is used to store entries. 
When an entry shall be deleted this BPN is used to verify that the requester is allowed to do so.

## Deployment
To deploy this system, you need to use the Helm Chart in a running
Kubernetes cluster. The Helm Chart is located under "charts/bpndiscovery". For further information checkout the [readme.md](https://github.com/eclipse-tractusx/sldt-bpn-discovery/blob/main/README.md) and the [install.md](INSTALL.md).  

## Security Assessment

### Data Flow Diagram

```mermaid
%%{init: {"flowchart": {"curve": "linear"} }}%%
flowchart
    DC(Data Consumer \n <i>e.g. IR</i>)
    DP(Data Provider)
    K(Keycloak)

    subgraph Discovery Finder
    DF(Discovery Finder Backend)
    DFDB[(Discovery Finder postgres)]
    end

    subgraph BPN Discovery
    BD(BPN Discovery Backend)
    BDDB[(BPN Discovery postgres \n <i>N instances per data \n asset type and usage</i>)]
    end
    
    DC <-->|Token request| K
    DP <-->|Token request| K

    DF <-->|Request endpoint for given type| DC
    DF <--> DFDB
    K -.->|Provide public key for token validation| DF

    BD <--> BDDB
    DC <-->|Request BPN for specific type| BD
    DP -->|Register BPN type key| BD
    BD -->|Success/error message for registration| DP
    K -.->|Provide public key for token validation| BD
```


### NOTICE

This work is licensed under the [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0).

- SPDX-License-Identifier: Apache-2.0
- SPDX-FileCopyrightText: 2023 Robert Bosch Manufacturing Solutions GmbH
- SPDX-FileCopyrightText: 2023 Contributors to the Eclipse Foundation
- Source URL: https://github.com/eclipse-tractusx/sldt-bpn-discovery.git
