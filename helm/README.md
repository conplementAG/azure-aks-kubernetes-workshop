# Application Deployment with Helm

***This page was influenced by the [AKS Workshop](https://aksworkshop.io/)***

## Introduction

- https://github.com/helm/helm > Quickstart Guide > Helm Commands

## Initialize Helm Tiller with RBAC  
- Login to the aks cluster `az aks get-credentials -g aksws-weu-[envtag]-rg -n aksws-weu-[envtag]-aks  --overwrite-existing`
- Inspect and deploy the service account with `kubectl apply -f helm-rbac.yaml`
- Install Tiller with `helm init --service-account tiller --wait --upgrade`

## Basic commands 
1. Create and inspect a test chart with the following steps
- `helm create test`
- `helm install --name myrelease ./test`
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
- `helm install stable/grafana`


# Other useful links

https://www.katacoda.com/courses/kubernetes/helm-package-manager

