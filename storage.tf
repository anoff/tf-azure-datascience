resource "azurerm_storage_account" "ds" {
  name                     = "rcsdsacc"
  resource_group_name      = "${azurerm_resource_group.ds.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "ds" {
  name                  = "rcs"
  resource_group_name   = "${azurerm_resource_group.ds.name}"
  storage_account_name  = "${azurerm_storage_account.ds.name}"
  container_access_type = "private"

  provisioner "local-exec" {
    command = "./provision_fileshare ${azurerm_resource_group.ds.name} ${azurerm_storage_account.ds.name} rcs-dl"
  }
}
