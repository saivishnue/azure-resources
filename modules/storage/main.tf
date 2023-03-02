# Storage account
resource "azurerm_storage_account" "nonprod-act" {
  name                     = var.name
  resource_group_name      = var.rg-name
  location                 = var.resource_group_loc
  account_tier             = var.accountTier
  account_replication_type = var.replicationType
}

# Data lake gen2
resource "azurerm_storage_data_lake_gen2_filesystem" "nonprod-dl" {
  name               = var.name
  storage_account_id = azurerm_storage_account.nonprod-act.id
}

# Storage blob
# resource "azurerm_storage_container" "non-prod" {
#   name                  = "blobsc"
#   resource_group_name   = var.resource_group
#   storage_account_name  = azurerm_storage_account.demo-non-stag-act.name
#   container_access_type = "private"
# }



# resource "azurerm_synapse_workspace" "demo-synapse" {
#   name                = var.name
#   location            = var.resource_group_loc
#   resource_group_name = var.resource_group
#   storage_data_lake_gen2_filesystem_id  = azurerm_storage_account.demo-non-stag-act.id


#   tags = {
#     Env = "non-stag"
#   }
# }
 