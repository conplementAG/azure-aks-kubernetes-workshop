# resource "random_uuid" "external-dns-sp-password" {
# }

# locals {
#   external_dns_sp_name = "aksws-${var.short_region}-${var.env_tag}-external-dns-service-principal"
# }

# # DNS Zone

# resource "azurerm_dns_zone" "dnszone" {
#   name                = "aksws.conplement.cloud" # change aksws to your env-tag! TODO: replace with variable
#   resource_group_name = local.resource_group_name
#   zone_type           = "Public"
# }

# output "dns_servers" {
#   value = azurerm_dns_zone.dnszone.name_servers
# }

# # Service Principal for Managing the DNS Zone
# # https://github.com/kubernetes-incubator/external-dns/blob/master/docs/tutorials/azure.md

# data "azurerm_resource_group" "resource-group" {
#   name = local.resource_group_name
# }

# resource "azuread_application" "external-dns-app" {
#   name                       = local.external_dns_sp_name
#   homepage                   = "https://${local.external_dns_sp_name}"
#   identifier_uris            = ["https://${local.external_dns_sp_name}"]
#   reply_urls                 = ["https://${local.external_dns_sp_name}"]
#   available_to_other_tenants = false
# }

# resource "azuread_service_principal" "external-dns-sp" {
#   application_id = azuread_application.external-dns-app.application_id
# }

# resource "azuread_service_principal_password" "external-dns-sp-password" {
#   service_principal_id = azuread_service_principal.external-dns-sp.id
#   value                = random_uuid.external-dns-sp-password.result
#   end_date             = timeadd(timestamp(), "8760h") # 1 year = 365 * 24 hours
# }

# resource "azurerm_role_assignment" "external-dns-sp-rg-reader" {
#   scope                = data.azurerm_resource_group.resource-group.id
#   role_definition_name = "Reader"
#   principal_id         = azuread_service_principal.external-dns-sp.id
# }

# resource "azurerm_role_assignment" "external-dns-sp-dnszone-contributor" {
#   scope                = azurerm_dns_zone.dnszone.id
#   role_definition_name = "Contributor"
#   principal_id         = azuread_service_principal.external-dns-sp.id
# }

# resource "kubernetes_secret" "azure-config-file" {
#   metadata {
#     name = "azure-config-file"
#   }

#   data = {
#     "azure.json" = <<EOF
#     {
#       "tenantId": "${var.tenant_id}",
#       "subscriptionId": "${var.subscription_id}",
#       "resourceGroup": "${data.azurerm_resource_group.resource-group.name}",
#       "aadClientId":"${azuread_application.external-dns-app.application_id}",
#       "aadClientSecret": "${azuread_service_principal_password.external-dns-sp-password.value}"
#     }
    
# EOF

#   }
# }

