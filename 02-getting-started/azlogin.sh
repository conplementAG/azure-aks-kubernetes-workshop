#!/bin/bash

echo 'Login to Azure'
az login --service-principal -u $ARM_CLIENT_ID -p $ARM_CLIENT_SECRET --tenant $TENANT_ID
az account set --subscription $SUBSCRIPTION_ID
