provider "azurerm" {
    features {
      
    }
  
}

resource "azurerm_resource_group" "deploy1" {
    name="myrg1"
    location = "eastus"
  
}

resource "azurerm_resource_group" "deploy2" {
    name="myrg2"
    location = "eastus"
  
}

resource "azurerm_resource_group" "deploy3" {
    name="myrg3"
    location = "eastus"
  
}