# Helm Chart - Example Application

## Overview

Inline-style: 
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

# Assuming that you already built your docker images locally
docker tag workshop/frontend <docker registry url>/workshop/frontend:latest
docker tag workshop/backend <docker registry url>/workshop/backend:latest

docker push <docker registry url>/workshop/frontend:latest
docker push <docker registry url>/workshop/backend:latest
```

## Install Helm Chart

```bash
# Install the nginx ingress controller
helm install --namespace <yournamespace> --name ingress-controller-release stable/nginx-ingress

# Install the acutal application
helm install --namespace <yournamespace> --name example-application-release example-application
```