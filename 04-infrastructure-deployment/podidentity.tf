locals {
  pod_identity_name = "aksws-${var.short_region}-${var.env_tag}-podid"
}

resource "azurerm_user_assigned_identity" "aad_pod_identity" {
  resource_group_name               = "${local.resource_group_name}"
  location                          = "${var.long_region}"
  name                              = "${local.pod_identity_name}"

  tags {
    Environment = "${var.env_tag}"
  }
}

resource "azurerm_role_assignment" "managed_identity_operator_role_assignment" {
  scope                = "${azurerm_user_assigned_identity.aad_pod_identity.id}"
  role_definition_name = "Managed Identity Operator"
  principal_id         = "${azurerm_azuread_service_principal.cluster_service_principal.id}"
  depends_on           = ["azurerm_user_assigned_identity.aad_pod_identity"]
}

resource "azurerm_role_assignment" "reader_role_assignment" {
  scope                = "${azurerm_key_vault.keyvault.id}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.aad_pod_identity.principal_id}"
  depends_on           = ["azurerm_user_assigned_identity.aad_pod_identity","azurerm_key_vault.keyvault"]
}