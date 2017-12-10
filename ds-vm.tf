variable "vm-name" {
  default = "user1"
}

resource "azurerm_virtual_network" "ds" {
  name                = "ds-network"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.ds.name}"
}

resource "azurerm_subnet" "ds" {
  name                 = "ds-subnet"
  resource_group_name  = "${azurerm_resource_group.ds.name}"
  virtual_network_name = "${azurerm_virtual_network.ds.name}"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_network_interface" "ds" {
  name                = "ds-ni"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.ds.name}"

  ip_configuration {
    name                          = "dsconfiguration1"
    subnet_id                     = "${azurerm_subnet.ds.id}"
    private_ip_address_allocation = "dynamic"
  }
}

resource "azurerm_virtual_machine" "ds" {
  name                  = "${var.vm-name}-vm"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.ds.name}"
  network_interface_ids = ["${azurerm_network_interface.ds.id}"]
  vm_size               = "Standard_DS1_v2"
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  plan {
    name = "linuxdsvmubuntu"
    publisher = "microsoft-ads"
    product = "linux-data-science-vm-ubuntu"
  }

  storage_image_reference {
    publisher = "microsoft-ads"
    offer     = "linux-data-science-vm-ubuntu"
    sku       = "linuxdsvmubuntu"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.vm-name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  # Optional data disks
  storage_data_disk {
    name              = "${var.vm-name}-data"
    managed_disk_type = "Standard_LRS"
    create_option     = "FromImage"
    lun               = 0
    disk_size_gb      = "120"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "dsadmin"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags {
    environment = "datascience-vm, ${var.vm-name}"
  }
}
