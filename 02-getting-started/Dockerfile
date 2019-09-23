
FROM mcr.microsoft.com/azure-cli

RUN apk update && apk add ca-certificates
RUN apk add bash unzip

ADD ./azure-kubernetes-workshop/02-getting-started/corporate_certs/* /usr/local/share/ca-certificates/
RUN chmod 644 /usr/local/share/ca-certificates/* && update-ca-certificates

# libc6 required for some downloaded executable files to work (missing in go compilation for linux systems)
RUN apk add libc6-compat

# Azure CLI storage account related commands do not work without
RUN pip install --upgrade pip

ARG TERRAFORM_VERSION=0.11.13

WORKDIR /usr/downloads

# install terraform
RUN curl -L https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip --output terraform.zip
RUN unzip terraform.zip
RUN mv terraform /usr/local/bin

ENV TF_DATA_DIR "/.terraform"
ARG PLUGIN_DIRECTORY=/.terraform/plugins/linux_amd64
RUN mkdir -p ${PLUGIN_DIRECTORY}

# install latest stable kubectl (Kubernetes CLI)
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# install latest stable helm
RUN curl -LO https://git.io/get_helm.sh
RUN chmod +x get_helm.sh
RUN ./get_helm.sh

WORKDIR /usr/src/ws

COPY . .

ENTRYPOINT ["/bin/bash"]