## INTRODUCTION TO KUBECTL

* kubectl is the only tool we'll need to talk to K8s
* Rich CLI tool around the K8s API
* Everything you can do with kubectl, you can do directly with the API
* Kubectl looks for a kubeconfig file ~/.kube/config which holds
    * Information where the API is
    * Auth information like TLS Certificate or a token

![Kubectl - API Server](images/kubectl-api.png "Kubectl - API Server") 

## HANDS ON

### CONTEXT SWITCHING

If you run multiple clusters you will need to choose which cluster kubectl talks to. You can set a default cluster for kubectl by 
setting the current context in kubeconfig file. Additionally you can run the commands against a cluster using the `--cluster` flag.

* View kubeconfig file `kubectl config view`
* Switch context `kubectl config use-context`

When on cloud to set up the context use the following:
1. `az login`
2. `az aks get-credentials -n xxx --resource-group xxx` 

![Context Switching](images/context_switching.png "Context Switching") 

### KUBECTL

* Look at the nodes of our cluster: `kubectl get node`
* The get command can output JSON, YAML or be directly formatted: `kubectl get nodes -o yaml` `kubectl get nodes -o json`
* Getting more info: `kubectl get nodes -o wide`

## BASIC RESOURCES
 
kubectl get ns
kubectl get namespaces
kubectl get namespace
 
kubectl get pods
kubectl get services -o wide
kubectl get deployments
 
kubectl get pods,services,deployments -o yaml

kubectl get nodes
 
## INFORMATION
 
kubectl describe pods, services, deployments
 
kubectl logs <POD_NAME> -f
 
kubectl apply -f <directory or file.yaml>
 
kubectl top nodes
kubectl top pods
 
## DEBUGGING
 
kubectl port-forward svc/<SERVICE_NAME> <LOCAL_PORT>:<REMOTE_PORT>
 
kubectl exec -it <POD_NAME> -- /bin/sh
kubectl exec -it <POD_NAME> -- /bin/bash
