# Application Deployment

[_Back to overview_](README.md)

## Helm Basics

### Introduction

- https://github.com/helm/helm > Quickstart Guide > Helm Commands
- 3 way merge strategy

### Basic commands

1. Create and inspect a test chart with the following steps

- `helm create test`
- `helm install --dry-run --debug --name myrelease ./test` // Helm 2...
- `helm install --dry-run --debug myrelease ./test` // Helm 3...
- Leave the `--dry-run --debug` options away to actually execute the command
- check out the created resources with `kubectl get pods`, `kubectl get deployments` and `kubectl get svc`
- create a port-forward using the podname `kubectl port-forward myrelease-test-... 8080:80`
- press `CTRL+Z` and enter `bg` and `curl 127.0.0.1:8080` to see the nginx response
- Similarly you can also use `helm template ./test --set ingress.enabled=true` to check out how the template would look like with the given value
- use `helm ls` to list up the installed releases

2. Upgrade to LoadBalancer

- `helm upgrade --set service.type=LoadBalancer --install myrelease ./test`
- Check for the state with `kubectl get svc` and `kubectl describe svc myrelease-test`

3. Inspect and delete release

- `helm get myrelease`
- `kubectl get secret` // Helm 3
- `kubectl get configmap --namespace kube-system` // Helm 2
- `helm delete myrelease`
- `helm ls -all`
- `helm delete myrelease --purge` // Purge only relevant for Helm 2

### Helm 3 repository

- `helm repo list` // No repositories are added by default
- `helm repo add stable https://kubernetes-charts.storage.googleapis.com` the
- `helm repo update`
- `helm fetch stable/redis --untar`
- `helm install stable/redis`

### Helm 2 topics

https://github.com/helm/charts/tree/master/stable

- `helm repo update` // Works without explicitly adding any repos

1. Initialize Helm Tiller with RBAC (Only Helm 2)

- Login to azure and login to the aks cluster [see also](../02-getting-started/README.md)
- Inspect and deploy the service account with `kubectl apply -f resources/helm-rbac.yaml`
- Install Tiller with `helm init --service-account tiller --wait --upgrade`

2. Helm 2 topics

- When deploying using Helm 2, you should not do manual changes on the deployed resources since Helm only tracks changes done through the Helm CLI!
- Migrate from Helm 2 to Helm 3 with [2to3](https://helm.sh/blog/migrate-from-helm-v2-to-helm-v3/)

### Other useful links

https://www.katacoda.com/courses/kubernetes/helm-package-manager

### References

- [Helm](https://helm.sh/)
- [AKS Workshop](https://aksworkshop.io/)
