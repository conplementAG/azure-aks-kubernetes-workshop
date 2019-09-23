# Application Deployment

[_Back to overview_](README.md)

## Helm Basics

### Introduction

When deploying using Helm, you should not do manual changes on the deployed resources since Helm only tracks changes done through the Helm CLI!

- https://github.com/helm/helm > Quickstart Guide > Helm Commands

### Initialize Helm Tiller with RBAC

- Login to azure and login to the aks cluster [see also](../02-getting-started/README.md)
- Inspect and deploy the service account with `kubectl apply -f resources/helm-rbac.yaml`
- Install Tiller with `helm init --service-account tiller --wait --upgrade`

### Basic commands

1. Create and inspect a test chart with the following steps

- `helm create test`
- `helm install --dry-run --debug --name myrelease ./test`
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
- `helm delete myrelease`
- `helm ls -all`
- `helm delete myrelease --purge`

### Install from Helm repo

https://github.com/helm/charts/tree/master/stable

- `helm repo update`
- `helm fetch stable/redis --untar`
- `helm install stable/redis`

### Other useful links

https://www.katacoda.com/courses/kubernetes/helm-package-manager

#### References

[AKS Workshop](https://aksworkshop.io/)
