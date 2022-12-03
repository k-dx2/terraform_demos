provider "azurerm" {
    features {
      
    }
  
}

resource "azurerm_resource_group" "deploy1" {
    name ="mytfrg1"
    location = "eastus"
    tags = {
      "department" = "training"
    }

  
}
resource "azurerm_resource_group" "deploy2" {
    name="mytfrg2"
    location="southindia"
}