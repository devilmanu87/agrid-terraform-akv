# This file will provide the list of variables used by terraform
# Created By : Ravi Kandaswamy
# Create Date : 6/1/2021

# Spoke Subscription, Resource Group, AKV SPN Object ID Variables

variable "spoke_subscription_id" {
  type        = string
  description = "spoke_subscription_id"
}

variable "spoke_resource_group" {
  type        = string
  description = "spoke_resource_group"
}

variable "spn_object_id" {
  type        = string
  description = "spn_object_id"
}

variable "pep_snet_name" {
  type        = string
  description = "pep_snet_name"
}

variable "vnet_name" {
  type        = string
  description = "vnet_name"
}

variable "vnet_rg_name" {
  type        = string
  description = "vnet_rg_name"
}

variable "akv_name" {
  type        = string
  description = "akv_name"
}

variable "akv_pep_name" {
  type        = string
  description = "akv_pep_name"
}

variable "akv_psc_name" {
  type        = string
  description = "akv_psc_name"
}

# Hub Subscription, Resource Group, Private DNS Variables
variable "hub_subscription_id" {
  type        = string
  description = "hub_subscription_id"
}

variable "hub_sr_rg" {
  type        = string
  description = "hub_sr_rg"
}

variable "hub_kv_pdns" {
  type        = string
  description = "hub_kv_pdns"
}


# Log Analytics Workspace Subscription, Resource Group and LAW Name Variables

variable "law_subscription_id" {
  type        = string
  description = "law_subscription_id"
}

variable "core_law_rg" {
  type        = string
  description = "core_law_rg"
}

variable "core_law_name" {
  type        = string
  description = "core_law_name"
}

variable "virtual_network_subnet_ids" {
  type        = list(string)
  description = "Key Vault network access: One or more Subnet ID's which should be able to access this Key Vault."
}
