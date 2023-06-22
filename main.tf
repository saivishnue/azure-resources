module "azurerm_resource_group_module" {
  source = "./modules/resource-group"
}

module "azurerm_storage_account_module" {
  source  = "./modules/storage"
  rg-name = module.azurerm_resource_group_module.rg-name
}

module "azurerm_synapse_workspace_module" {
  source                                    = "./modules/synapse-workspace"
  rg-name                                   = module.azurerm_resource_group_module.rg-name
  azurerm_storage_data_lake_gen2_filesystem_id = module.azurerm_storage_account_module.azurerm_storage_data_lake_gen2_filesystem_id
  storage_account_name                      = module.azurerm_storage_account_module.storage_account_name
  azurerm_storage_data_lake_gen2_filesystem = module.azurerm_storage_account_module.azurerm_storage_data_lake_gen2_filesystem
}