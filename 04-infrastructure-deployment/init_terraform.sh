#!/bin/bash

TERRAFORM_STORAGE_NAME=akswsstorage$ENVTAG
TERRAFORM_RG_NAME=aksws-$SHORT_REGION-$ENVTAG-rg

. ../02-getting-started/azlogin.sh

echo 'Create resource group'
az group create -n $TERRAFORM_RG_NAME -l $LOCATION

echo 'Create storage account and container'
az storage account create --resource-group $TERRAFORM_RG_NAME --name $TERRAFORM_STORAGE_NAME --location $LOCATION --sku Standard_LRS

TERRAFORM_STORAGE_KEY=$(az storage account keys list --account-name $TERRAFORM_STORAGE_NAME --resource-group $TERRAFORM_RG_NAME --query [0].value -o tsv)

az storage container create -n tfstate --account-name $TERRAFORM_STORAGE_NAME --account-key $TERRAFORM_STORAGE_KEY

echo 'Initialze Terraform with remote state handling'
terraform init -backend-config="storage_account_name=$TERRAFORM_STORAGE_NAME" -backend-config="container_name=tfstate" -backend-config="access_key=$TERRAFORM_STORAGE_KEY" -backend-config="key=codelab.microsoft.tfstate" 