# AKS manual setup

## for quick access and results
Do a manual setup of AKS in the azure portal.

- select subscription
- select or create resource group
- give a name
- select region
- select version
- select dns name prefix
- select node size (B2s should be sufficient)
- scale default
- use a new or create a service principal for authentication
- enable rbac
- use basic networking to get rid of vnet detail setup
- enable azure monitor

## commands
- use cloud shell 
    - create storage if asked for
- az login
- az aks get-credentials -n <AKS-NAME> -g <RG>
- kube config gonna be created
- ready to go 
- try "kubectl get pods"

## explanations about resources (optional)
- explain azure resources 