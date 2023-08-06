# #resource group
# resource "azurerm_resource_group" "tf" {
#   name     = "mouni" 
#   location = "East US"
# }

# #aks cluster
# resource "azurerm_kubernetes_cluster" "aks_cluster" {
#   name                = "my-aks-cluster"
#   location            = azurerm_resource_group.tf.location
#   resource_group_name = azurerm_resource_group.tf.name
#   dns_prefix          = "myakscluster"
  
#   default_node_pool {
#     name       = "default"
#     node_count = 1
#     vm_size    = "B2ms"
#   }
#    service_principal {
#       client_id = "6f4ab529-fdc6-4610-b240-a4b9476688a5"
#       client_secret = "jwZ8Q~mRfQXSayKhPtu_apTMYRcVkLF1NVIuUbWx"
#       }
  
#   tags = {
#     environment = "dev"
#   }
# }

# #storage account
# resource "azurerm_storage_account" "tfstate_storage" {
#   name                     = "tfstatestorageaccount"
#   resource_group_name      = azurerm_resource_group.tf.name
#   location                 = azurerm_resource_group.tf.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

#   tags = {
#     environment = "dev"
#   }
# }

# #storage container
# resource "azurerm_storage_container" "tfstate_container" {
#   name                  = "tfstate-container"
#   storage_account_name = azurerm_storage_account.tfstate_storage.name
#   container_access_type = "private"
# }

# terraform {
#   backend "azurerm" {
#     resource_group_name   = azurerm_resource_group.tfstate_rg.name
#     storage_account_name  = azurerm_storage_account.tfstate_storage.name
#     container_name        = azurerm_storage_container.tfstate_container.name
#     key                   = "terraform.tfstate"
#   }
# }