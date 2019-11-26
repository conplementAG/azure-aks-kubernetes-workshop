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

* Manages a set of Pods (replicas)
* Self healing capability
* Scale up/down capability



#### StatefulSet
#### DeamonSet
#### Job

### Control Plane

- Nodes

See this [overview page](https://kubernetes.io/docs/concepts/) for more details.
