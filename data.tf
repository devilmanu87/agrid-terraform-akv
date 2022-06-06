# This file will get resource information based on the input provided
# Created By : Ravi Kandaswamy
# Create Date : 6/1/2021

# Get Current Client Configuration

data "azurerm_client_config" "current" {}

# Get Resource Group where Client Key Vault will be created

data "azurerm_resource_group" "spokerg" {
  name = var.spoke_resource_group
}

# Get Subnet for Private EndPoint 

data "azurerm_subnet" "pepsubnet" {
  name                 = var.pep_snet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_rg_name
}


# Get Hub KV Private DNS Zone

data "azurerm_private_dns_zone" "kvpdns" {
  provider            = azurerm.hub
  name                = var.hub_kv_pdns
  resource_group_name = var.hub_sr_rg
}

# Get Core LAW data

data "azurerm_log_analytics_workspace" "law" {
  provider            = azurerm.law
  name                = var.core_law_name
  resource_group_name = var.core_law_rg
}
