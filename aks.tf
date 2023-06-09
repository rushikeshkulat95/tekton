resource "azurerm_kubernetes_cluster" "azurerm_kubernetes_cluster" {
    for_each = var.azurerm_kubernetes_cluster
    name = join("-", [each.value.name, var.application, var.environment, var.region, each.value.num])
    resource_group_name = azurerm_resource_group.azurerm_resource_group["rg1"].name
    location = var.location
    dns_prefix = "exampleaks1"
    default_node_pool {
        name       = "default"
        node_count = 1
        vm_size    = "Standard_D2_v2"
    }
    identity {
        type = "SystemAssigned"
    }
    tags = local.tags


  
}