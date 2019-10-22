locals {
  keyvault_name = "aksws-${var.short_region}-${var.env_tag}-kv"
}

data "azurerm_client_config" "client" {
}

resource "azurerm_key_vault" "keyvault" {
  name                        = local.keyvault_name
  location                    = var.long_region
  resource_group_name         = local.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"

  access_policy {
    tenant_id = var.tenant_id
    object_id = data.azurerm_client_config.client.service_principal_object_id

    key_permissions     = ["get", "list", "update", "create", "import", "delete", "recover", "backup", "restore"]
    secret_permissions  = ["get", "list", "set", "delete", "recover", "backup", "restore"]
    storage_permissions = ["get", "list", "update", "delete", "recover", "backup", "restore"]
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_role_assignment" "keyvault_role_assignment" {
  scope                = azurerm_key_vault.keyvault.id
  role_definition_name = "Reader"
  principal_id         = azurerm_azuread_service_principal.cluster_service_principal.id
}

resource "azurerm_key_vault_secret" "test_secret" {
  name         = "test-secret"
  value        = "secret-secret"
  key_vault_id = azurerm_key_vault.keyvault.id
}

