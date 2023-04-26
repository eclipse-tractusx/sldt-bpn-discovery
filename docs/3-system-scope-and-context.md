## 3 System scope and context

### Business Context

![](/media/image2.PNG)

|  Neighbor |  Description |
|---|---|
| Consumer App  | Searches a BPN |
|  Data Provider |Registers his type and keys at BPN Discovery   |
| Discovery Finder  | Provides the endpoints of BPN Discoveries  |
| Keycloak  |  Administrates the authorization token |


### Technical Context

![](/media/image3.PNG)

|  Neighbor | Description                                                              |
|---|--------------------------------------------------------------------------|
| Consumer App  | Requests for BPN with an type and type number                            |
|  Data Provider | Requests for register or delete entries from BPN Discovery               |
| Discovery Finder  | Receives request from BPN Discovey of self-registration purpose          |
| Keycloak  | Generates token for users and provides id management of user and service |
