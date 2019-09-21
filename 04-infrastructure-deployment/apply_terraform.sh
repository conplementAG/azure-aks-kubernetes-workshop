#!/bin/bash

echo 'Apply Terraform template'
terraform apply -var env_tag=$ENVTAG -var long_region=$LOCATION -var short_region=$SHORT_REGION -var subscription_id=$SUBSCRIPTION_ID -var tenant_id=$TENANT_ID -var cluster_server_app_id=$CLUSTER_SERVER_APP_ID -var cluster_server_app_secret=$CLUSTER_SERVER_APP_SECRET -var cluster_client_app_id=$CLUSTER_CLIENT_APP_ID -var acr_id=$ACR_ID -var cluster_admin_group_id=$CLUSTER_ADMIN_GROUP_ID
