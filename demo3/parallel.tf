provider "azurerm" {
    features {

    }
  
}
resource "azurerm_resource_group" "deploy1" {
    name = "mytfrg1"
    location = "southindia"
    
}
resource "azurerm_resource_group" "deploy2" {
    name = "mytfrg2"
    location = "southindia"
  
}
resource "azurerm_resource_group" "deploy3" {
    name = "mytfrg3"
    location = "southindia"
    
}