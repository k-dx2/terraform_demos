provider "azurerm" {
    features {

    }
  
}
resource "azurerm_resource_group" "deploy1" {
    name = "mytfrg1"
    location = "southindia"
    depends_on = [
      azurerm_resource_group.deploy2
    ]
    
}
resource "azurerm_resource_group" "deploy2" {
    name = "mytfrg2"
    location = "southindia"
    depends_on = [
      azurerm_resource_group.deploy3
    ]
  
}
resource "azurerm_resource_group" "deploy3" {
    name = "mytfrg3"
    location = "southindia"
    
}