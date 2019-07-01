locals {
  resource_group_name = "aksws-${var.short_region}-${var.env_tag}-rg"
  aks_name = "aksws-${var.short_region}-${var.env_tag}-aks"
  aks_cluster_sp_name = "aksws-${var.short_region}-${var.env_tag}-aks-service-principal"
  vnet_name = "aksws-${var.short_region}-${var.env_tag}-vnet"
  log_analytics_workspace_name = "aksws-${var.short_region}-${var.env_tag}-lga"
}

resource "random_uuid" "aks_password" { }

terraform {
  backend "azurerm" {
    container_name  = "keystore"
    key             = "terraform.state"
  }
}

provider "azurerm" {
  version = "=1.26"
  subscription_id = "${var.subscription_id}"
  tenant_id       = "${var.tenant_id}"
  # service principal client id & secret will be read from ARM_CLIENT_ID / ARM_CLIENT_SECRET env variables if set, 
  # and in that case service principal auth will be used
}

resource "azurerm_role_assignment" "acr_pull_role_assignment" {
  scope                = "${var.acr_id}"
  role_definition_name = "AcrPull"
  principal_id         = "${azurerm_azuread_service_principal.cluster_service_principal.id}"
}

resource "azurerm_azuread_application" "cluster_app_registration" {
  name                       = "${local.aks_cluster_sp_name}"
  homepage                   = "https://${local.aks_cluster_sp_name}"
  identifier_uris            = ["https://${local.aks_cluster_sp_name}-uri"]
  reply_urls                 = ["https://replyurl"]
  available_to_other_tenants = false
}

resource "azurerm_azuread_service_principal" "cluster_service_principal" {
  application_id = "${azurerm_azuread_application.cluster_app_registration.application_id}"
}

resource "azurerm_azuread_service_principal_password" "cluster_service_principal_password" {
  service_principal_id = "${azurerm_azuread_service_principal.cluster_service_principal.id}"
  value                = "${random_uuid.aks_password.result}"
  end_date             = "${timeadd(timestamp(), "8760h")}" # 1 year = 365 * 24 hours
}

resource "azurerm_virtual_network" "main_vnet" {
  name                              = "${local.vnet_name}"
  address_space                     = ["10.0.0.0/16"]
  resource_group_name               = "${local.resource_group_name}"
  location                          = "${var.long_region}"

  tags {
    Environment = "${var.env_tag}"
  }
}

resource "azurerm_subnet" "cluster_subnet" {
  name                              = "cluster-subnet"
  resource_group_name               = "${local.resource_group_name}"
  address_prefix                    = "10.0.0.0/20"  # 10.0.0.0 - 10.0.15.255
  virtual_network_name              = "${azurerm_virtual_network.main_vnet.name}"
}

resource "azurerm_subnet" "appgw_subnet" {
  name                              = "appgw-subnet"
  resource_group_name               = "${local.resource_group_name}"
  address_prefix                    = "10.0.17.0/24" # 10.0.17.0 - 10.0.17.255
  virtual_network_name              = "${azurerm_virtual_network.main_vnet.name}"
}

resource "azurerm_log_analytics_workspace" "aks_loganalytics_workspace" {
  name                = "${local.log_analytics_workspace_name}"
  resource_group_name = "${local.resource_group_name}"
  location            = "${var.long_region}"
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags {
    environment = "${var.env_tag}"
  }
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                      = "${local.aks_name}"
  location                  = "${var.long_region}"
  resource_group_name       = "${local.resource_group_name}"
  dns_prefix                = "${local.aks_name}"
  kubernetes_version        = "1.12.7" # az aks get-versions -l westeurope -o table

  agent_pool_profile {
    name            = "default"
    count           = 3
    vm_size         = "Standard_DS2_v2"
    vnet_subnet_id  = "${azurerm_subnet.cluster_subnet.id}"
  }

  role_based_access_control {
    azure_active_directory {
      server_app_id = "${var.cluster_server_app_id}"
      server_app_secret = "${var.cluster_server_app_secret}"
      client_app_id = "${var.cluster_client_app_id}"
    }
    enabled = true
  }

  network_profile {
      network_plugin = "azure"
      service_cidr   = "10.1.0.0/24"
      dns_service_ip = "10.1.0.10"
      docker_bridge_cidr = "172.17.0.1/16"
  }

  service_principal {
    client_id     = "${azurerm_azuread_application.cluster_app_registration.application_id}"
    client_secret = "${azurerm_azuread_service_principal_password.cluster_service_principal_password.value}"
  }

  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = "${azurerm_log_analytics_workspace.aks_loganalytics_workspace.id}"
    }
  }

  tags {
    Environment = "${var.env_tag}"
  }
}

# resource "azurerm_role_assignment" "network_contributor_role_assignment" {
#   scope                = "${azurerm_virtual_network.main_vnet.id}"
#   role_definition_name = "Network Contributor"
#   principal_id         = "${azurerm_azuread_service_principal.cluster_service_principal.id}"
# }