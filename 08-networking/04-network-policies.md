# Networking

[_Back to overview_](README.md)

## Network Policies

### References

- https://docs.microsoft.com/en-us/azure/aks/concepts-network#network-policies
- https://kubernetes.io/docs/concepts/services-networking/network-policies/

### Implementation with Istio

- https://istio.io/docs/tasks/traffic-management/request-routing/

### Implementation with Cilicium

- https://github.com/cilium/cilium/blob/master/Documentation/kubernetes/intro.rst

### Notes:

Implications of Dynamically Orchestrated Containers

- 900x start time
- 15x workloads
- 25x shorter lifetype
- 375x network curn
- 15x attack surface

-> Security at Network Layer

https://kubernetes.io/docs/concepts/security/overview/

Firewall outside of the cluster is not enough.

=> Zero Trust Security Model
=> Policy as Code (Developer First)
=> Needs a plugin, e.g. Tigera Calico
