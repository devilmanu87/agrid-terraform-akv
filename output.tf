# This file will generate the output for azure resources 
# Created By : Ravi Kandaswamy
# Create Date : 6/1/2021

output "rgid" {
  value = data.azurerm_resource_group.spokerg.id
}

output "rgname" {
  value = data.azurerm_resource_group.spokerg.name
}

output "rglocation" {
  value = data.azurerm_resource_group.spokerg.location
}

output "pepsubnet_id" {
  value = data.azurerm_subnet.pepsubnet.id
}
