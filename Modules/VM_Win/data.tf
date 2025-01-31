data "azurerm_resource_group" "datarg" {
  name = "Resource_Group"
}

data "azurerm_network_interface" "datani" {
  for_each            = var.win_vms
  name                = each.value.ni
  resource_group_name = data.azurerm_resource_group.datarg.name
}

data "azurerm_key_vault_secret" "datakey" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.datakv.id
}

data "azurerm_key_vault" "datakv" {
  name                = "SubhojitKeyVaultwithSc"
  resource_group_name = data.azurerm_resource_group.datarg.name
}

data "azurerm_subscription" "sub" {
}

data "azurerm_client_config" "config" {
}