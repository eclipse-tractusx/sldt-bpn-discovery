# bpndiscovery

![Version: 0.6.0](https://img.shields.io/badge/Version-0.6.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.6.1](https://img.shields.io/badge/AppVersion-0.6.1-informational?style=flat-square)

Tractus-X BPN Discovery Helm Chart

**Homepage:** <https://eclipse-tractusx.github.io/>

## Source Code

* <https://github.com/eclipse-tractusx/sldt-bpn-discovery>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 12.12.10 |

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure

## Install

To install the chart with the release name `bpndiscovery`:

```shell
helm repo add tractusx-dev https://eclipse-tractusx.github.io/charts/dev
helm install bpndiscovery tractusx-dev/bpndiscovery
```

To install the helm chart into your cluster with your values:

```shell
helm install -f your-values.yaml bpndiscovery tractusx-dev/bpndiscovery
```

To use the helm chart as a dependency:

```yaml
dependencies:
  - name: bpndiscovery
    repository: https://eclipse-tractusx.github.io/charts/dev
    version: YOUR_VERSION
```

To install the local version in the namespace _semantics_:

```shell

helm dependency update .

helm install bpndiscovery -n semantics . --create-namespace
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| bpndiscovery.authentication | bool | `false` |  |
| bpndiscovery.bpndiscoveryEndpoint.allowedTypes | string | `"oen,wmi"` |  |
| bpndiscovery.bpndiscoveryEndpoint.description | string | `"bpndiscovery"` |  |
| bpndiscovery.bpndiscoveryEndpoint.documentation | string | `"/bpndiscovery/swagger/index.html"` |  |
| bpndiscovery.bpndiscoveryEndpoint.endpointAddress | string | `"/bpndiscovery"` |  |
| bpndiscovery.bpndiscoveryEndpoint.timeToLive | string | `"31536000"` |  |
| bpndiscovery.containerPort | int | `4243` |  |
| bpndiscovery.dataSource.driverClassName | string | `"org.postgresql.Driver"` |  |
| bpndiscovery.dataSource.password | string | `nil` |  |
| bpndiscovery.dataSource.sqlInitPlatform | string | `"pg"` |  |
| bpndiscovery.dataSource.url | string | `"jdbc:postgresql://database:5432"` | The url, user, and password parameter will be ignored if 'enablePostgres' is set to true. In that case the postgresql auth parameters are used. |
| bpndiscovery.dataSource.user | string | `nil` |  |
| bpndiscovery.discoveryfinderClient.baseUrl | string | `"/discoveryfinder"` |  |
| bpndiscovery.discoveryfinderClient.provider.tokenUri | string | `"/realms/discovery/protocol/openid-connect/token"` |  |
| bpndiscovery.discoveryfinderClient.registration.authorizationGrantType | string | `"client_credentials"` |  |
| bpndiscovery.discoveryfinderClient.registration.clientId | string | `"discovery-finder-client"` |  |
| bpndiscovery.discoveryfinderClient.registration.clientSecret | string | `"client-secret"` |  |
| bpndiscovery.discoveryfinderClient.schedulerCronFrequency | string | `"0 0 */1 * * *"` |  |
| bpndiscovery.host | string | `"localhost"` |  |
| bpndiscovery.idp.bpnIdClaimName | string | `"bpn"` |  |
| bpndiscovery.idp.issuerUri | string | `"https://idp-url"` |  |
| bpndiscovery.idp.publicClientId | string | `"idpClientID"` |  |
| bpndiscovery.image.imagePullPolicy | string | `"IfNotPresent"` |  |
| bpndiscovery.image.registry | string | `"docker.io"` |  |
| bpndiscovery.image.repository | string | `"tractusx/sldt-bpn-discovery"` |  |
| bpndiscovery.image.version | string | `""` |  |
| bpndiscovery.ingress.annotations | object | `{}` |  |
| bpndiscovery.ingress.className | string | `"nginx"` |  |
| bpndiscovery.ingress.enabled | bool | `false` | enable ingress, default false |
| bpndiscovery.ingress.rules | list | `[]` | specify rules on your own, if the pathType Prefix + Regex runs into issues with your ClusterIssuer has a "strict-validate-path-type" check. -host.http.paths[0].path must at least be set. Then pathType "ImplementationSpecific" is used with common service name and port. Multiple paths may be specified |
| bpndiscovery.ingress.tls.enabled | bool | `false` | enable tls, default false |
| bpndiscovery.ingress.tls.secretName | string | `"bpndiscovery-certificate-secret"` | reuse secret in namespace with given name, default "bpndiscovery-certificate-secret" |
| bpndiscovery.ingress.urlPrefix | string | `"/bpndiscovery"` | use a urlPrefix to define a path of pathType "Prefix" with regex. Result is a path "/bpndiscovery(/|$)(.*)" |
| bpndiscovery.livenessProbe.failureThreshold | int | `3` |  |
| bpndiscovery.livenessProbe.initialDelaySeconds | int | `100` |  |
| bpndiscovery.livenessProbe.periodSeconds | int | `3` |  |
| bpndiscovery.readinessProbe.failureThreshold | int | `3` |  |
| bpndiscovery.readinessProbe.initialDelaySeconds | int | `100` |  |
| bpndiscovery.readinessProbe.periodSeconds | int | `3` |  |
| bpndiscovery.replicaCount | int | `1` |  |
| bpndiscovery.resources.limits.cpu | string | `"750m"` |  |
| bpndiscovery.resources.limits.memory | string | `"1024Mi"` |  |
| bpndiscovery.resources.requests.cpu | string | `"250m"` |  |
| bpndiscovery.resources.requests.memory | string | `"1024Mi"` |  |
| bpndiscovery.service.port | int | `8080` |  |
| bpndiscovery.service.type | string | `"ClusterIP"` |  |
| enablePostgres | bool | `true` |  |
| fullnameOverride | string | `nil` |  |
| nameOverride | string | `nil` |  |
| postgresql.auth.database | string | `"bpndiscovery"` |  |
| postgresql.auth.existingSecret | string | `"secret-bpndiscovery-postgres-init"` | Secret contains passwords for username postgres. |
| postgresql.auth.password | string | `nil` |  |
| postgresql.auth.username | string | `"default-user"` |  |
| postgresql.image.repository | string | `"bitnamilegacy/postgresql"` | workaround to use bitnamilegacy chart for version 12.12.x till committers align on new postgresql charts |
| postgresql.image.tag | string | `"15.4.0-debian-11-r45"` | workaround to use bitnamilegacy chart for version 12.12.x till committers align on new postgresql charts |
| postgresql.primary.persistence.enabled | bool | `true` |  |
| postgresql.primary.persistence.size | string | `"50Gi"` |  |
| postgresql.service.ports.postgresql | int | `5432` |  |

## NOTICE

This work is licensed under the [CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/legalcode).

- SPDX-License-Identifier: CC-BY-4.0
- SPDX-FileCopyrightText: 2023 Contributors to the Eclipse Foundation
- Source URL: https://github.com/eclipse-tractusx/sldt-discovery-finder