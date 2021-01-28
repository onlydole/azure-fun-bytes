output "azure_kubectl_command" {
  description = "Pre-filled kubectl command"
  value = "az aks get-credentials --resource-group \"${azurerm_resource_group.project.name}\" --name \"${var.project_name}\""
}

#output "aks_host" {
#  description = "AKS host address"
#  value = module.aks.host
#}

#output "aks_kube_config_raw" {
#  description = "AKS kubectl configuration"
#  value = module.aks.kube_config_raw
#}

# For additional module outputs, see:
#  `aks`:      https://registry.terraform.io/modules/Azure/aks/azurerm/latest?tab=outputs
#  `network`:  https://registry.terraform.io/modules/Azure/network/azurerm/latest?tab=outputs
