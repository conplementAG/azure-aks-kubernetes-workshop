# azure-kubernetes-workshop

## General guideline

Throughout the workshop a main Docker container will be used which is to be built and started in an interactive mode.

* Create a `corporate_certs` folder and copy the certificates there. If you want to use it behind a corporate proxy, it might be necessary to use the certificates of it.

* Build the docker container
```bash
docker build . --build-arg http_proxy=http://host.docker.internal:3128 --build-arg https_proxy=http://host.docker.internal:3128 -t aksws

# Use the following for building NOT behind a corporate proxy
# docker build . -t aksws
```
* Create and configure a local `config.env` file by copying the `config.env.template`

* Run the just built container as follows
```bash
docker run -it --rm -v %cd%:/usr/src/app --env-file config.env aksws 
```

* Login to Azure
From inside the container you have to be logged in to Azure either by executing the `azlogin.sh` script or by directly running `az login` correctly parameterized 

* Create the [Infrastructure with Terraform](terraform/README.md)

* Login to the aks cluster with `az aks get-credentials -g aksws-weu-$ENVTAG-rg -n aksws-weu-$ENVTAG-aks --overwrite-existing`

## [Application Deployment with Helm](helm/README.md)