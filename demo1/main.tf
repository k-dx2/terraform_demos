provider "azurerm" {
    features {

    }
  
}
resource "azurerm_resource_group" "deploy1" {
    name = "mytfrg1"
    location = "southindia"
    
  
}