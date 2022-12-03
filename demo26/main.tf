provider "azurerm" {
  features { 
  }
}

data "azurerm_resources" "dep1" {
  resource_group_name = "lab-rg1"
  
}



output "outvar1" {
  value = data.azurerm_resources.dep1.id
}