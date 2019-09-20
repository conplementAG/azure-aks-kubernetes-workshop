# Basic Concepts

[_Back to overview_](README.md)

## Infrastructure Ops

### OS Updates

Patches are automatically applied to the VMs of the AKS cluster. Some Updates require a reboot of the VMs to apply - **this reboot will not be done automatically**.
If a reboot is required the following file will be created: `/var/run/reboot-required`

#### KURED

You can use [Kured (KUbernetes REboot Deamon) DeamonSet](https://github.com/weaveworks/kured) to automate the reboot step, see: https://docs.microsoft.com/en-us/azure/aks/node-updates-kured

### Cluster Version Upgrades

#### Check for updates manually

```
az aks get-upgrades --resource-group myResourceGroup --name myAKSCluster --output table
```

See also [supported Kubernetes Versions](https://docs.microsoft.com/en-us/azure/aks/supported-kubernetes-versions).

#### Subscribe to updates

To automtically be notified when new AKS Updates are available, you can subscribe to release-updates the [Azure/AKS on github.com](https://github.com/Azure/AKS):
![Watch AKS Github Project](images/k8s-github-watch-releases.jpg)

#### Install an update (this will take a few minutes):

```
az aks upgrade --resource-group myResourceGroup --name myAKSCluster --kubernetes-version 1.13.10
```
