resource "azurerm_resource_group" "nonprod-rg" {
  name     = var.rg-name
  location = var.location
}