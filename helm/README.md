# Application Deployment with Helm

***This page was influenced by the [AKS Workshop](https://aksworkshop.io/)***

## Introduction

When using helm over k8s, then it is not suggested to do manual changes on the k8s resources as they are surely not recognized by Helm.

- https://github.com/helm/helm > Quickstart Guide > Helm Commands


## Initialize Helm Tiller with RBAC  
- Login to azure and login to the aks cluster [see also](../README.md)
- Inspect and deploy the service account with `kubectl apply -f helm-rbac.yaml`
- Install Tiller with `helm init --service-account tiller --wait --upgrade`

## Basic commands 
1. Create and inspect a test chart with the following steps
- `helm create test`
- `helm install --dry-run --debug --name myrelease ./test`
- Leave the `--dry-run --debug` options away to actually execute the command
- Similarly you can also use `helm template ./test --set ingress.enabled=true`
- `helm ls`
  
2. Upgrade to LoadBalancer
- `helm upgrade --set service.type=LoadBalancer --install myrelease ./test`
- Check for the state with `kubectl get svc` and `kubectl describe svc myrelease-test`

3. Inspect and delete release
- `helm get myrelease`
- `helm delete myrelease`
- `helm ls -all`
- `helm delete myrelease --purge`

## Install from Helm repo
https://github.com/helm/charts/tree/master/stable
- `helm repo update`
- `helm fetch stable/redis --untar`
- `helm install stable/redis`
- `helm fetch`

# Other useful links

https://www.katacoda.com/courses/kubernetes/helm-package-manager

