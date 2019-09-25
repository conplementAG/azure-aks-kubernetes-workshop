# Networking

[_Back to overview_](README.md)

## Session Affinity (a.k.a. Sticky Sessions)

Session Affinity can be used to ensure that requests from one client are always routed to the same endpoint (pod).
An example of such usage would be websocket connections.

To enable session affinity using k8s services, you have to be running in IPVS kube-proxy mode: https://kubernetes.io/docs/concepts/services-networking/service/#proxy-mode-ipvs

To implement session affinity on ingress level, check here:

https://github.com/DenisBiondic/RealTimeMicroservices/blob/master/BackendForFrontend/deployment.yaml
