# Networking

[_Back to overview_](README.md)

## AKS Networking Basics

There are two different networking modes in AKS:

### Basic Networking Mode

- Done with Kubenet network plugin and has the following features
  - Nodes and Pods are placed on different IP subnets
  - User defined routing and IP forwarding is for connectivity between Pods across Nodes
- Drawbacks
  - 2 different IP CIDRs to manage
  - Performance impact
  - Peering or On-Premise connectivity is hard to archieve

### Advanced Networking Mode

- Done using the Azure CNI (Container Networking Interface)
  - CNI is a vendor-neutral protocol, used by container runtimtes to make requests to Network Providers
  - Azure CNI is an implementation which allows you to integrate Kubernetes with your VNET
- Advantages
  - Single IP CIDR to manage
  - Better Performance
  - Peering and On-Premise connectivitiy is out of the box
  - Network Policy coming soon to Azure CNI plugin on AKS, already in acs-engine

### References

- https://docs.microsoft.com/en-us/azure/aks/concepts-network
- https://www.slideshare.net/QAware/best-practices-with-azure-kubernetes-services-123776449
