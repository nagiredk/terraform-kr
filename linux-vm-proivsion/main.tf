resource "azurerm_linux_virtual_machine" "main" {
  name                = "${var.prefix}-rhel-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = "P@ssword1234!"  # 👉 Use a strong password

  network_interface_ids = [
    azurerm_network_interface.nic1.id
  ]

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "9_4"
    version   = "latest"
  }

  os_disk {
    name                 = "${var.prefix}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  disable_password_authentication = false  # 👉 Enable password auth
}
