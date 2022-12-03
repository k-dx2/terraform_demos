provider "azurerm" {
    features {
      
    }
  
}

resource "azurerm_resource_group" "deploy1" {
    name=var.rgname
    location = var.rgloc
    
  
}