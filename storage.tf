resource "azurerm_storage_account" "ds" {
  name                     = "tfdsacc"
  resource_group_name      = azurerm_resource_group.ds.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "ds" {
  name = "tfdsshare"

  resource_group_name  = azurerm_resource_group.ds.name
  storage_account_name = azurerm_storage_account.ds.name

  quota = 50
}

