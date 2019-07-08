# System Components

![Overview Image](kubernetes-overview.png "Overview")

For more information see: [https://kubernetes.io/docs/concepts/overview/components/](https://kubernetes.io/docs/concepts/overview/components/).

## Master Components

These components run typical on a seperate machine, even if they don't have to.
They are responsible for:

* Global decisions about the cluster (e.g. scheduling)
* In AKS high available managed server

### kube-apiserver

* [Github: kube-apiserver](https://github.com/kubernetes/kubernetes/tree/master/cmd/kube-apiserver)
* Kubernetes API
* Frontend for the Kubernetes Control Plane
* Receives commands from `kubectl` tool
* Exposed by AKS (see Azure Portal or `kubectl cluster-info`)

### etcd

* [Github: etcd](https://github.com/etcd-io/etcd)
* Key-Value Store for all cluster data

### kube-scheduler

* [Github: kube-scheduler](https://github.com/kubernetes/kubernetes/tree/master/cmd/kube-scheduler)
* Starts new pods as containers on nodes
* Takes several metrics into consideration, like resources, etc.

### kube-controller-manager

* [Github: kube-controller-manager](https://github.com/kubernetes/kubernetes/tree/master/cmd/kube-controller-manager)
* Runs controllers in a single process
* Controllers:
    * Node Controller: Handles Node Shutdowns
    * Replication Controller: Ensure correct number of pods
    * Endpoints Controller: Populates endpoints (pods, services)
    * Service Account & Token Controllers

### cloud-controller-manager

* [Github: cloud-controller-manager](https://github.com/kubernetes/kubernetes/tree/master/cmd/cloud-controller-manager)
* Interaction with the underlying cloud providers
* Controllers
    * Node: Lifecycle management of cloud nodes
    * Route: Routing in the Cloud Infrastructure
    * Service: Handles Load Balancers
    * Volume: Mounting and interacting with Cloud Storages
    
## Node Components

### kubelet

* [Github: https://github.com/kubernetes/kubernetes/tree/master/cmd/kubectl](https://github.com/kubernetes/kubernetes/tree/master/cmd/kubectl)
* Manages Pods on nodes
* Also Virtual Kubelet: *"Kubernetes API on top, programmable bac"*: [Github virtual-kubelet](https://github.com/virtual-kubelet/virtual-kubelet)

### kube-proxy

* [Github: kube-proxy](https://github.com/kubernetes/kubernetes/tree/master/cmd/kube-proxy)
* Networking Abstraction
* Kubernetes service abstraction
* Connection-Forwarding

### Container Runtime

* Runtime to run containers, e.g. docker

### cAdvisor

* Integrated into kubelet
* Collects CPU, memory, filesystem, and network usage statistics of containers and exposes them to kubelet

## Addons

To further enhance functionality there are several addons that can be included:

* DNS
    * DNS Server in the cluster
* Web UI (Dashboard)
    * Simple Web UI for managing kubernetes
* Container Resource Monitoring
    * Metric collection and monitoring
* Cluster-level Logging
    * Store logs in a central log store