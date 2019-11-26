# Basic Concepts

[_Back to overview_](README.md)

## Kubernetes Core Concepts

### Kubernetes Objects

#### Pod

* Smallest execution unit of K8s
* It is just an execution environment for one or more tightly coupled containers
* Provides shared storage/network for containers in it
* Containers in Pod reach each other using `localhost`
* Each Pod gets assigned a unique IP address.

Pods are ephemeral. They are not designed to run forever. Once its terminated it cannot be brought back. They do not 'heal' nor repair itslef. Each time its recreated it gets a new identity and a new IP.

Beacuse they are ephemeral, it is not recommended to create Pods directly. Use a controller like a Deployment which creates and manages Pods for you.

Pod Status:

* Pending
* Running
* Succeeded
* Failed
* Unknown

Best practicies for Pods:

* Set Pod limits (CPU and memory)
* Keep your Pods small (best practice one container per Pod)
* Always terminate Pods in a gracefull way
* When possible and running on different node pool run Pods on nodes based on the workflow type

#### Hands on for Pods

* Lets open and analyze the file `./pod.yml`
* Lets deploy it to the cluster `kubectl apply -f pod.yml`
* List all pods `kubectl get pods`
* Lets kill it `kubectl delete pod xxxPodNamexxx`
* Lets see if it is still there `kubectl get pods`

#### Service

* A stable endpoint to connect to "something"

#### Volume
#### Namespace

### Controller Objects

#### ReplicaSet
#### Deployment

Why Pod replication?

* Reliability
* Load balancing
* Scaling

A brief history?

Replication Controller is the original form of replication in
K8s. It is a structure that enables you to easily create multiple pods, then make sure that that number of pods always exists. 

Replica Sets are same as replication controller the only difference lies that a replica set supports set-based selector whreas a RC only supports equality based selector requirements.

Equality-based selector: `environment = production; tier != frontend`

Set-based requirement: `environment in (production, qa); !partition`

Deployments

* Manages a set of Pods (replicas)
* Self healing capability
* Scale up/down capability

![Deployment](images/deployment.png "Deployment") 

Best practicies Deployments

* Use only for stateless services

#### Hands on Deployments 

* Lets open and analyze the file `./deployment.yml`
* Lets deploy it to the cluster `kubectl apply -f deployment.yml`
* List all pods `kubectl get pods`
* Lets kill it `kubectl delete pod xxxPodNamexxx`
* Lets see the self healing capability `kubectl get pods`
* Clear the resources `kubectl delete deployment web`

#### StatefulSet
#### DeamonSet
#### Job

### Control Plane

- Nodes

See this [overview page](https://kubernetes.io/docs/concepts/) for more details.
