<!--
    Copyright (c) 2021-2023 Contributors to the Eclipse Foundation

    See the NOTICE file(s) distributed with this work for additional
    information regarding copyright ownership.

    This program and the accompanying materials are made available under the
    terms of the Apache License, Version 2.0 which is available at
    https://www.apache.org/licenses/LICENSE-2.0.

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
    License for the specific language governing permissions and limitations
    under the License.

    SPDX-License-Identifier: Apache-2.0
-->

# BPN Discovery

The BPN Discovery is a logical and architectural component of Tractus-X. The source code under this folder contains reference implementations of the SLDT BPN
Discovery.
The BPN Discovery is used to lookup for a specific type/key-combination to a Business Partner Number (BPN). For example looking for a
combination "oen / oen-133" will lead to "BPNLXYZ123". For a further information have a look in our
[documentation](docs/1-introduction-and-goals.md).

## Build Packages

Run `mvn clean install` to run unit tests, build and install the package.

## Run Package Locally

To check whether the build was successful, you can start the resulting JAR file from the build process by
running `java -jar backend/target/bpn-discovery-backend-{current-version}.jar --spring.profiles.active=local`.

## Build Docker

Run `docker build -f backend/Dockerfile -t sldt-bpn-discovery .`

In case you want to publish your image into a remote container registry, apply the tag accordingly and `docker push` the image.

## Install Instructions
For detailed install instructions please refer to our [INSTALL.md](INSTALL.md).

## Notice for Docker image

DockerHub: https://hub.docker.com/r/tractusx/sldt-bpn-discovery
This application provides container images for demonstrations purposes.
Eclipse Tractus-X product(s) installed within the image:

- GitHub: https://github.com/eclipse-tractusx/sldt-bpn-discovery
- Project home: https://projects.eclipse.org/projects/automotive.tractusx
- Dockerfile: https://github.com/eclipse-tractusx/sldt-bpn-discovery/blob/main/backend/Dockerfile
- Project license: Apache License, Version 2.0

**Used base image**

- eclipse-temurin:17-jre-alpine
- Official Eclipse Temurin DockerHub page: https://hub.docker.com/_/eclipse-temurin
- Eclipse Temurin Project: https://projects.eclipse.org/projects/adoptium.temurin
- Additional information about the Eclipse Temurin images: https://github.com/docker-library/repo-info/tree/master/repos/eclipse-temurin

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.