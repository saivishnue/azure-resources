resource "azurerm_synapse_workspace" "synapse_ws" {
  name                = var.azurerm_synapse_workspace_name
  resource_group_name = var.rg-name
  location            = var.resource_group_loc
  storage_data_lake_gen2_filesystem_id  = var.azurerm_storage_data_lake_gen2_filesystem_id

}