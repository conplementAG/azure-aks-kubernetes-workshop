# Networking

[_Back to overview_](README.md)

## Network Policies

Firewall outside of the cluster is not enough.

=> Zero Trust Security Model
=> Policy as Code (Developer First)

## Implementation options

- Azure CNI
- Other plugins, e.g. Tigera Calico
- Service Meshes (Istio etc.)

### References:

- https://docs.microsoft.com/en-us/azure/aks/concepts-network#network-policies
- https://kubernetes.io/docs/concepts/services-networking/network-policies/
- https://istio.io/docs/tasks/traffic-management/request-routing/
- https://kubernetes.io/docs/concepts/security/overview/
- https://github.com/cilium/cilium/blob/master/Documentation/kubernetes/intro.rst