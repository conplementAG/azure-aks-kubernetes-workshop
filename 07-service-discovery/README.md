# Networking

[_Back to overview_](README.md)

## Service Discovery

### Internal DNS service discovery

To start a container with curl and other network debugging tools, run:

`kubectl run my-curl --image=radial/busyboxplus:curl --generator=run-pod/v1 -i --tty --rm`

You can now play around with commands such as `curl -v backend.my-namespace`

### Labeling

For the demo, we will use the teams demo app and the aks-hello-world helm charts.

1. Install both applications

- `helm repo add azure-samples https://azure-samples.github.io/helm-charts/`
- `helm install azure-samples/aks-helloworld`

2. Play around with labeling

- `apk add nano`
- `KUBE_EDITOR="nano" kubectl edit svc frontnend -n <your_namespace>`

### Load balancing and access from outside the cluster

There are several service types:
- ClusterIP
- NodePort
- LoadBalancer
- ExternalName

Topic of Ingress will be additionally clarified under 09-advanced-networking section.