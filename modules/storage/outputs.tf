
output "Storage_group_id" {
  value = azurerm_storage_account.nonprod-act.id
}

output "storage_account_name" {
  value = azurerm_storage_account.nonprod-act.name
}

output "azurerm_storage_data_lake_gen2_filesystem" {
  value = azurerm_storage_data_lake_gen2_filesystem.nonprod-dl.name
}

output "azurerm_storage_data_lake_gen2_filesystem_id" {
  value = azurerm_storage_data_lake_gen2_filesystem.nonprod-dl.id
}