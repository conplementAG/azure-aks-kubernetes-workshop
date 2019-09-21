# Getting Started

[_Back to agenda_](../README.md)

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
docker run -it --rm -v %cd%\..\:/usr/src/app --env HTTP_PROXY=http://docker.for.win.localhost:3128 --env HTTPS_PROXY=http://docker.for.win.localhost:3128 --env-file ./config.env aksws
```

Use `$(pwd)/../` instead of `%cd%\..\` on unix systems.

## Create Infrastructre

- Login to Azure
  From inside the container you have to be logged in to Azure either by executing the `azlogin.sh` script or by directly running `az login` correctly parameterized

- Create the [Infrastructure with Terraform](../04-infrastructure-deployment/README.md)

### Login to AKS

- Login to the aks cluster with `az aks get-credentials -g aksws-weu-$ENVTAG-rg -n aksws-weu-$ENVTAG-aks --overwrite-existing`