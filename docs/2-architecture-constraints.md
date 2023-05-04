## 2 Architecture and constraints

### Overall Architecture

A consumer sends a request to the Discovery Finder with a catalogue of a certain types e.g., "bpid", "oen". The Discovery Finder
responses with a list of endpoints of BPN Discoveries which provide BPNs for these kind of types.  
Subsequently the consumer sends a request to the given BPN Discoveries. If the BPN Discovery finds a matching entries he returns a list of BPNs.
With the given BPN the consumer can search for EDCs at the EDC Discovery according to this BPN.

### Overall-View

![](media/OverallConcept.png)

### Architecture
A consumer can request for BPNs for a given type/key combination, e.g. "oen" / "example-oen". The BPN Discovery responses
with the BPN, if it is in its database.

### Constraints

-   Needs to register BPN Discovery to Discovery Finder.

-   Provider must register their entries in BPN Discovery.

-   Every Provider handles its own EDC / Digital Twin - this is no
    central service.

-   Consumer and Data Provider must have a technical user with correct user-roles for BPN Discovery.

-   The BPN Discovery is a central component and must be managed by one
    instance.

-   The Discovery Finder and Keycloak services must be up and running.
    Without them the BPN Discovery can't be found or used.

-   The BPN Discovery rely on Discovery Finder: the BPN Discovery has to register itself on startup otherwise, the discovery can't be found.

### Architecture Constraints

-   Developed under an open-source license and all used frameworks and
    libraries suites to this license.

-   Must be compliant and fulfill the Catena-X Guidelines.

-   The deployment is done in a Catena-X environment. So, the BPN
    Discovery must be able to run in a Kubernetes environment with Helm
    Charts.

-   The BPN Discovery must be managed centralized.

-   Keycloak as an OAuth2 compliant authorization is needed to manage the identity of and access of the user.