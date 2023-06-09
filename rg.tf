resource "azurerm_resource_group" "azurerm_resource_group" {
  for_each = var.azurerm_resource_group
  name     = join("-", [each.value.name, var.application, var.environment, each.value.num])
  location = var.location
  tags     = local.tags
}