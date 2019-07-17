# Helm Chart - Example Application

## Overview

![Overview Image](example-application.png "Overview")


## Prerequesites

* Docker (https://www.docker.com/get-started)
* Helm 2.9.1 (https://helm.sh/docs/using_helm/#installing-helm)

## Principles

The helm chart shows the following principals:

* using subcharts
* templating values
* share variables between subcharts
* install a local chart into a kubernetes cluster (no remote helm repository)
* install a chart from a remote repository into a kubernetes cluster

## Build and Push Docker Images

Before deploying the example application into your kubernetes cluster, you have to make sure the docker images are available in the container registry, that the kubernetes cluster is connected to.

```bash
docker login <docker registry url>
# Type in your username and password

# Build (make sure you are in the right directory (/example-application))
docker build Frontend -t workshop/frontend
docker build Backend -t workshop/backend

# Push
docker tag workshop/frontend <docker registry url>/workshop/frontend:latest
docker tag workshop/backend <docker registry url>/workshop/backend:latest

docker push <docker registry url>/workshop/frontend:latest
docker push <docker registry url>/workshop/backend:latest
```

## Step 1: Install Helm Chart

```bash
# Install the nginx ingress controller
helm install --namespace <yournamespace> --name ingress-controller-release stable/nginx-ingress

# Install the acutal application
helm install --namespace <yournamespace> --name example-application-release example-application
```

## Step 2: Override environment variables

## Environment Variables

The two applications can be configured by the following environment variables:

### Backend

* `ASPNETCORE_ENVIRONMENT`: Switch between Development or Production mode
* `ASPNETCORE_URLS`: Set the HTTP and HTTPS-Port
* `VERSION`: Will be returned by the API

### Frontend

* `COLOR`: The Color of the displayed box
* `PORT`: The HTTP port on which it is running
* `BACKEND_HOST`: The Backend-Host for performing ajax requests
* `VERSION`: The Version that will be displayed

These variables can be set in the `values.yaml` files or by the [`--set` parameter](https://helm.sh/docs/using_helm/).

For example:

```bash
helm upgrade example-application-release example-application --namespace <yournamespace> --set Frontend.Settings.Color=pink

# Browse to public IP of the ingress-controller and check for the new color
kubectl get svc -n <yournamespace>
```


## Step 3: Enable Health Checks

See [this blog post](https://cloud.google.com/blog/products/gcp/kubernetes-best-practices-setting-up-health-checks-with-readiness-and-liveness-probes) for further information.

```bash
helm upgrade example-application-release example-application --namespace <yournamespace> --set Frontend.Settings.Color=pink,global.HealthChecks.enabled=true

# Check Health Check Urls
kubectl describe deployment -n <yournamespace> frontend
```

## Step 4: Enable Resource Management

Resource-Management is essiential when using logic isolation.

Microsoft developed kube-advisor for getting resource recommendations for your cluster.
```bash
kubectl run --rm -i -t kube-advisor --image=mcr.microsoft.com/aks/kubeadvisor --restart=Never
```

See [this blog post](https://cloud.google.com/blog/products/gcp/kubernetes-best-practices-setting-up-health-checks-with-readiness-and-liveness-probes) for further information.

```bash
helm upgrade example-application-release example-application --namespace <yournamespace> --set Frontend.Settings.Color=pink,global.HealthChecks.enabled=true,global.ResourceManagement.enabled=true

# Check Limits and Requests
kubectl describe deployment -n <yournamespace> frontend
```