# see https://registry.terraform.io/modules/Azure/network/azurerm/3.2.1
module "network" {
  source              = "Azure/network/azurerm"
  version             = "3.2.1"

  resource_group_name = azurerm_resource_group.project.name
  address_space       = "11.0.0.0/16"
  subnet_prefixes     = ["11.0.1.0/24"]
  subnet_names        = ["subnet1"]
  depends_on          = [azurerm_resource_group.project]

  tags = {
    Operator = var.tags.Operator
  }
}