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

* Run the just built container as follows
```bash
docker run -it --rm -v %cd%:/usr/src/app aksws 
```

## [Infrastructure with Terraform](terraform/README.md)

## [Application Deployment with Helm](helm/README.md)