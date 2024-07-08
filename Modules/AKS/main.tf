resource "azurerm_kubernetes_cluster" "aks" {
    for_each= var.aks
  name                = each.value.name
  location            = data.azurerm_resource_group.datarg.location
  resource_group_name = data.azurerm_resource_group.datarg.name
  dns_prefix          = "subhojit-aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw

  sensitive = true
}