resource "azurerm_windows_virtual_machine" "example" {
  for_each            = var.win_vms
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.datarg.name
  location            = data.azurerm_resource_group.datarg.location
  size                = "Standard_F2"
  admin_username      = each.value.user
  admin_password      = data.azurerm_key_vault_secret.datakey.value
  network_interface_ids = [data.azurerm_network_interface.datani[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}