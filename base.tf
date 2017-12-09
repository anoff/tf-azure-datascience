variable "location" {
  default = "westeurope"
}

resource "azurerm_resource_group" "ds" {
  name     = "rcs-datascience"
  location = "${var.location}"
}