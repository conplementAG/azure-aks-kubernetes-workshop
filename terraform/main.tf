locals {
  resource_group_name = "aksws-${var.short_region}-${var.env_tag}-rg"
  vnet_name = "aksws-${var.short_region}-${var.env_tag}-vnet"
}

terraform {
  backend "azurerm" {
    container_name  = "keystore"
    key             = "terraform.state"
  }
}

provider "azurerm" {
  version = "=1.31"
  subscription_id = "${var.subscription_id}"
  tenant_id       = "${var.tenant_id}"
  # service principal client id & secret will be read from ARM_CLIENT_ID / ARM_CLIENT_SECRET env variables if set, 
  # and in that case service principal auth will be used
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