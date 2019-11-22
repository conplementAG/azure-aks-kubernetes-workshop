# Kubernetes 101

## I have a docker image - what´s next
- docker registry secret [https://medium.com/@pjbgf/azure-kubernetes-service-aks-pulling-private-container-images-from-azure-container-registry-acr-9c3e0a0a13f2]

## Where is it running
- "pods"
	- namespace
	- containers/image
	- resources/limits
- needs "nodes"
	- container host
	- kubelet
- needs "master"
	- kube-scheduler
	- etcd
	- kube-controller-manager: nodecontroller, endpoint controller, replication controller
	- kube-apiserver: we always communicate with the master api

## How to deploy
- kubectl apply
- "deployment"
	- containers
	- labels
- you need env variables? 
	- config maps
	- env variables
	- secrets
- you need to scale? 
	- relicas/replicaset

## see it running
- see commands
- "get", "describe" and "logs"

## I can´t access it or other services cant access it
- take a look at "service" type "load-balancer"
- label and selector principle
- "ingress" and "ingress controller" [https://kubernetes.io/docs/concepts/services-networking/ingress/]
- "port-forwarding" the service [https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/]

## too many resources caused by many people or many environments?
- "namespaces"



