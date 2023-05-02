## 1 Introduction and goals

The Digital Twins are no longer administrated in a central registry
anymore. The implementation of two services, "Discovery Finder" and "BPN
Discovery", ensure that EDCs can be found in the decentralized
environment.

The BPN Discovery is responsible to help to find a corresponding BPN to
a given type / key pair e.g., for a "oen".

### High level requirement

The BPN Discovery is used to find according BPNs for a given
type / key combination.

### Quality goals

-   Ensure that EDCs can be found.

-   Data sovereignty is given. The provider takes care / is responsible
    for his data.

-   All users and services are secured and can only access when
    authenticated and authorized.

-   Discovery Finder and BPN Discovery are "central" services
    (horizontal and vertical scalability included) and meant to help to
    connect companies. So, it is integrated into the
    Catena-X network with all their services.

### Stakeholders

| Role             | Description                                              | Goal, Intention                                      |
|------------------|----------------------------------------------------------|------------------------------------------------------|
| Consumer         | uses a BPN Discovery                                     | wants to find a BPN                                  |
| Data Provider    | Registers his keys of a specific type in a BPN Discovery | wants that his EDC / Digital Twin can be found       |
| Catena-X network |                                                          | to enable the companies to connect and exchange data |