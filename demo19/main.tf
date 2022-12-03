provider "azurerm" {
    features {
      
    }
  
}

variable "create_rg" {
    type = bool
  
}

resource "azurerm_resource_group" "deploy1" {
    count = var.create_rg?1:0

    name="myrg1"
    location = "eastus"
  
}


resource "azurerm_resource_group" "deploy2" {
    count = var.create_rg?0:1

    name="myrg2"
    location = "southindia"
  
}