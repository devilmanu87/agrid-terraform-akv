# This file will create Azure Key Vault , Access Policy, Private End Point and Private DNS Associattion
# Diagnostic Setting (LAW) is created by Azure Policy
# Created By : Ravi Kandaswamy
# Create Date : 6/1/2021

# Create Client Key Vault

resource "azurerm_key_vault" "clientakv" {
  name                        = var.akv_name
  location                    = data.azurerm_resource_group.spokerg.location
  resource_group_name         = data.azurerm_resource_group.spokerg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  network_acls {
    bypass                     = "AzureServices"
    default_action             = "Deny"
    ip_rules                   = ["50.201.19.35"]
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }

  sku_name = "standard"

  # Adding the SPN of Terraform script for Write access to this AKV
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "List",
      "Create",
      "Update",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
    ]

    certificate_permissions = [
      "Get",
      "List",
      "Create",
      "Import",
      "Update",
    ]

    storage_permissions = [
      "Get",
      "List",
      "Set",
    ]
  }
}

# Create Client Key Vault Access Policy

resource "azurerm_key_vault_access_policy" "clientakvap" {
  key_vault_id = azurerm_key_vault.clientakv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = var.spn_object_id

  # Adding CLIENT SPN for Read access to AKV objects
    key_permissions = [
      "Get",
      "List",
    ]

    secret_permissions = [
      "Get",
      "List",
    ]

    certificate_permissions = [
      "Get",
      "List",
    ]

    storage_permissions = [
      "Get",
      "List",
    ]
}

# Create Client Key Vault Private End Point and Associate to Private DNS 

resource "azurerm_private_endpoint" "clientakvpep" {
  name                = var.akv_pep_name
  location            = data.azurerm_resource_group.spokerg.location
  resource_group_name = data.azurerm_resource_group.spokerg.name
  subnet_id           = data.azurerm_subnet.pepsubnet.id

  private_service_connection {
    name                           = var.akv_psc_name
    private_connection_resource_id = azurerm_key_vault.clientakv.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.kvpdns.id]
  }

}
