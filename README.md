# Azure Kubernetes Workshop

![conplement.de](conplement-github-logo.jpg)

`azure-kubernetes-workshop` is a workshop documentation with hands-on exercises for people already working with Kubernetes. Throughout the workshop a main Docker container will be used which is to be built and started in an interactive mode.

**Status: In Progress**

:warning: :construction:

Current this project is heaviliy in progress.

## Prerequisits

For more information see [Prerequisits](organization/prerequisits.md)

## Agenda

For more information see [Agenda](organization/agenda.md)

## Configure and run main container

### Build main container behind a corporate proxy

```bash
docker build . --build-arg http_proxy=http://host.docker.internal:3128 --build-arg https_proxy=http://host.docker.internal:3128 -t aksws
```

### Build main container without proxy

```bash
docker build . -t aksws
```

- Create and configure a local `config.env` file by copying the `config.env.template`

## Run the main container

### Run without a cooperate proxy

```bash
docker run -it --rm -v %cd%:/usr/src/app --env-file config.env aksws
```

### Run behind a cooperate proxy

Make sure you can authenticate towards your cooprate proxy via a local proxy (cntlm etc.) over port 3128.

```bash
docker run -it --rm -v %cd%:/usr/src/app --env HTTP_PROXY=http://docker.for.win.localhost:3128 --env HTTPS_PROXY=http://docker.for.win.localhost:3128 --env-file ./config.env aksws
```

## Create Infrastructre

- Login to Azure
  From inside the container you have to be logged in to Azure either by executing the `azlogin.sh` script or by directly running `az login` correctly parameterized

- Create the [Infrastructure with Terraform](terraform/README.md)

### Login to AKS

- Login to the aks cluster with `az aks get-credentials -g aksws-weu-$ENVTAG-rg -n aksws-weu-$ENVTAG-aks --overwrite-existing`

## Application Deployment with Helm

For more information see [Helm](helm/README.md)

## Application Deployment with CNAB

For more information see [CNAB](cnab/README.md)

## Application configuration

TBD
