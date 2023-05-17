## 1 Introduction and goals

The Digital Twins are no longer administrated in a central registry. The implementation of two services, "Discovery Finder" and "BPN
Discovery", ensure that Eclipse Data Space Connectors (EDC) can be found in the decentralized
environment.

The BPN Discovery is responsible to find a corresponding Business Partner Number (BPN) to
a given type / key pair e.g. "oen".

### High level requirement

The BPN Discovery is used to find according BPNs for a given type / key combination.

### Quality goals

-   Ensure that EDCs can be found.

-   Data sovereignty is given. The provider is responsible for his data.

-   All users and services are secured and can only access when
    authenticated and authorized.

-   Discovery Finder and BPN Discovery are "central" services
    (horizontal and vertical scalability included) and meant to help to
    connect companies. So, it is integrated into the Catena-X network.

### Stakeholders

| Role             | Description                                              | Goal, Intention                                      |
|------------------|----------------------------------------------------------|------------------------------------------------------|
| Consumer         | uses a BPN Discovery                                     | wants to find a BPN                                  |
| Data Provider    | registers his keys of a specific type in a BPN Discovery | wants that his EDC / Digital Twin can be found       |
| Catena-X network | provides the environment and operates the services       | to enable the companies to connect and exchange data |

#### Legal Notice
* SPDX-License-Identifier: CC-BY-4.0
* Licence Path: https://creativecommons.org/licenses/by/4.0/legalcode
* Copyright statements
* Source URL: https://github.com/eclipse-tractusx/sldt-bpn-discovery