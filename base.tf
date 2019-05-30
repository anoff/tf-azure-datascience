variable "location" {
  default = "westeurope"
}

resource "azurerm_resource_group" "ds" {
  name     = "tf-datascience"
  location = var.location
}

