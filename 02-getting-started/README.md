# Getting Started

[_Back to agenda_](../README.md)

## Source code

Create a directory and checkout following source code in folders next to each other:
- this repository: `git clone https://github.com/conplementAG/azure-kubernetes-workshop.git`
- example application repository `git clone https://github.com/conplementAG/teams-demo-app.git`

## Configure and run main container

Make sure you are located in the **02-getting-started** directory, and follow the next steps, depending whether you are running behind a corporate proxy or not.

### Configuration

Create and configure a local `config.env` file by copying the `config.env.template`

### Build main container behind a corporate proxy

```bash
docker build %cd%\..\..\ -f Dockerfile --build-arg http_proxy=http://host.docker.internal:3128 --build-arg https_proxy=http://host.docker.internal:3128 -t aksws
```

### Build main container without proxy

```bash
docker build %cd%\..\..\ -f Dockerfile -t aksws
```

## Run the main container

### Run without a cooperate proxy

```bash
docker run -it --rm -v %cd%\..\..\:/usr/src/ws --env-file config.env aksws
```

### Run behind a cooperate proxy

Make sure you can authenticate towards your cooprate proxy via a local proxy (cntlm etc.) over port 3128.

```bash
docker run -it --rm -v %cd%\..\..\:/usr/src/ws --env HTTP_PROXY=http://docker.for.win.localhost:3128 --env HTTPS_PROXY=http://docker.for.win.localhost:3128 --env-file ./config.env aksws
```

Use `$(pwd)/../../` instead of `%cd%\..\..\` on unix systems.

## Create Infrastructre

- `cd azure-kubernetes-workshop/02-getting-started/`
- Login to Azure by executing `./azlogin.sh`
- Create the [Infrastructure with Terraform](../04-infrastructure-deployment/README.md)

### Login to AKS

- Login to the aks cluster with `az aks get-credentials -g aksws-$SHORT_REGION-$ENVTAG-rg -n aksws-$SHORT_REGION-$ENVTAG-aks --overwrite-existing`