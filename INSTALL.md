## Deploy using Helm and K8s

If you have a running Kubernetes cluster available, you can deploy the BPN Discovery using our Helm Chart, which is located under `charts/bpndiscovery`. In case
you don't have a running cluster, you can set up one by yourself locally, using [minikube](https://minikube.sigs.k8s.io/docs/start/). In the following, we will
use a minikube cluster for reference.

Before deploying the BPN Discovery, enable a few add-ons in your minikube cluster by running the following commands:

`minikube addons enable storage-provisioner`

`minikube addons enable default-storageclass`

`minikube addons enable ingress`

Fetch all dependencies by running `helm dep up charts/bpndiscovery`.

In order to deploy the helm chart, first create a new namespace "discovery": `kubectl create namespace discovery`.

Then run `helm install bpndiscovery -n discovery charts/bpndiscovery`. This will set up a new helm deployment in the discovery namespace. By default, the
deployment contains the BPN Discovery instance itself, and a Postgresql.

Check that the two containers are running by calling `kubectl get pod -n discovery`.

To access the BPN Discovery API from the host, you need to configure the `Ingress` resource. By default, the `Ingress` is disabled.

If you enable the `Ingress`, the BPN Discovery exposes the API on https://minikube/discovery/bpndiscovery. For that to work, you need to append `/etc/hosts`
by running `echo "minikube $(minikube ip)" | sudo tee -a /etc/hosts`.

For automated certificate generation, use and configure [cert-manager](https://cert-manager.io/). By default, authentication is deactivated, please
adjust `bpndiscovery.authentication` if needed.

## Parameters

The Helm Chart can be configured using the following parameters. For a full overview, please see the [values.yaml](./charts/bpndiscovery/values.yaml).

### BPN Discovery parameters and PostgreSQL parameters

Please have a look into the [README.md](charts/bpndiscovery/README.md).

### Prerequisites

- Kubernetes 1.19+ 
- Helm 3.2.0+ 
- PV provisioner support in the underlying infrastructure