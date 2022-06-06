# This file will configure provider information
# Created By : Ravi Kandaswamy
# Create Date : 6/1/2021


# Azure Resource Manager and Azure Active Directory Required Terraform Providers

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.72.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.0.0"
    }
  }
}

# Azure Active Directory Provider

provider "azuread" {

}

# Azure Resource Manager Provider for AGRID Spoke

provider "azurerm" {
  features {}

  subscription_id = var.spoke_subscription_id
  skip_provider_registration = true
}

# Azure Resource Manager Provider for AGRID Hub

provider "azurerm" {
  features {}
  alias = "hub"

  subscription_id = var.hub_subscription_id
  skip_provider_registration = true

}

# Azure Resource Manager Provider for AGRID Log Analytics Workspace

provider "azurerm" {
  features {}
  alias = "law"

  subscription_id = var.law_subscription_id
  skip_provider_registration = true
}
