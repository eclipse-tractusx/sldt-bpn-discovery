# bpndiscovery

![Version: 0.1.5](https://img.shields.io/badge/Version-0.1.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.2.2-M1](https://img.shields.io/badge/AppVersion-0.2.2--M1-informational?style=flat-square)

**Tractus-X BPN Discovery Helm Chart** <br/>
This Helm Chart installs the BPN Discovery and its dependencies.

## Source Code

* <https://github.com/eclipse-tractusx/sldt-bpn-discovery>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 12.2.3 |

## Prerequisites
- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure

## Install
```
helm dep up charts/bpndiscovery
kubectl create namespace discovery
helm install bpndiscovery -n discovery charts/bpndiscovery
```

## Values

| Key | Type | Default                             | Description |
|-----|------|-------------------------------------|-------------|
| bpndiscovery.authentication | bool | `false`                             |  |
| bpndiscovery.bpndiscoveryEndpoint.allowedTypes | string | `"oen,wmi"`                         |  |
| bpndiscovery.bpndiscoveryEndpoint.description | string | `""`                                |  |
| bpndiscovery.bpndiscoveryEndpoint.documentation | string | `""`                                |  |
| bpndiscovery.bpndiscoveryEndpoint.endpointAddress | string | `""`                                |  |
| bpndiscovery.containerPort | int | `4243`                              |  |
| bpndiscovery.dataSource.driverClassName | string | `"org.postgresql.Driver"`           |  |
| bpndiscovery.dataSource.password | string | `"password"`                        |  |
| bpndiscovery.dataSource.sqlInitPlatform | string | `"pg"`                              |  |
| bpndiscovery.dataSource.url | string | `"jdbc:postgresql://database:5432"` |  |
| bpndiscovery.dataSource.user | string | `"user"`                            |  |
| bpndiscovery.discoveryfinderClient.baseUrl | string | `""`                                |  |
| bpndiscovery.discoveryfinderClient.provider.tokenUri | string | `""`                                |  |
| bpndiscovery.discoveryfinderClient.registration.authorizationGrantType | string | `"client_credentials"`              |  |
| bpndiscovery.discoveryfinderClient.registration.clientId | string | `"default-discovery-finder-client"` |  |
| bpndiscovery.discoveryfinderClient.registration.clientSecret | string | `""`                                |  |
| bpndiscovery.discoveryfinderClient.schedulerCronFrequency | string | `"0 0 */1 * * *"`                   |  |
| bpndiscovery.host | string | `"localhost"`                       |  |
| bpndiscovery.idp.bpnIdClaimName | string | `"bpn"`                             |  |
| bpndiscovery.idp.issuerUri | string | `""`                                |  |
| bpndiscovery.idp.publicClientId | string | `"default-client"`                  |  |
| bpndiscovery.image.imagePullPolicy | string | `"IfNotPresent"`                    |  |
| bpndiscovery.image.registry | string | `"docker.io"`                       |  |
| bpndiscovery.image.repository | string | `"tractusx/sldt-bpn-discovery"`     |  |
| bpndiscovery.image.version | string | `""`                                |  |
| bpndiscovery.ingress.annotations."cert-manager.io/cluster-issuer" | string | `"selfsigned-cluster-issuer"`       |  |
| bpndiscovery.ingress.annotations."nginx.ingress.kubernetes.io/cors-allow-credentials" | string | `"true"`                            |  |
| bpndiscovery.ingress.annotations."nginx.ingress.kubernetes.io/enable-cors" | string | `"true"`                            |  |
| bpndiscovery.ingress.annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2"`                             |  |
| bpndiscovery.ingress.annotations."nginx.ingress.kubernetes.io/use-regex" | string | `"true"`                            |  |
| bpndiscovery.ingress.annotations."nginx.ingress.kubernetes.io/x-forwarded-prefix" | string | `"/bpndiscovery"`                   |  |
| bpndiscovery.ingress.className | string | `"nginx"`                           |  |
| bpndiscovery.ingress.enabled | bool | `false`                             |  |
| bpndiscovery.ingress.tls | bool | `false`                             |  |
| bpndiscovery.ingress.urlPrefix | string | `"/bpndiscovery"`                   |  |
| bpndiscovery.replicaCount | int | `1`                                 |  |
| bpndiscovery.resources.limits.memory | string | `"1024Mi"`                          |  |
| bpndiscovery.resources.requests.memory | string | `"512Mi"`                           |  |
| bpndiscovery.service.port | int | `8080`                              |  |
| bpndiscovery.service.type | string | `"ClusterIP"`                       |  |
| enablePostgres | bool | `true`                              |  |
| postgresql.auth.database | string | `"bpndiscovery"`                    |  |
| postgresql.auth.password | string | `"password"`                        |  |
| postgresql.auth.username | string | `"catenax"`                         |  |
| postgresql.primary.persistence.enabled | bool | `true`                              |  |
| postgresql.primary.persistence.size | string | `"50Gi"`                            |  |
| postgresql.service.ports.postgresql | int | `5432`                              |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
