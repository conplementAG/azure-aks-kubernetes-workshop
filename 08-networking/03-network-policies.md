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

## Example

- Edit the backend-policy.yaml file and replace the namespace with your namespace where you have test pods running.
- Start a test container with wget in *default* namespace, check that the connection works:
  - `kubectl run --rm -it wget-test-pod --image=alpine --generator=run-pod/v1`
- `kubectl apply -f backend-policy.yaml`
- Check with the wget test container that you have no connection
- play around with labeling `kubectl label namespace/default purpose=development`

### References:

- https://docs.microsoft.com/en-us/azure/aks/concepts-network#network-policies
- https://kubernetes.io/docs/concepts/services-networking/network-policies/
- https://istio.io/docs/tasks/traffic-management/request-routing/
- https://kubernetes.io/docs/concepts/security/overview/
- https://github.com/cilium/cilium/blob/master/Documentation/kubernetes/intro.rst