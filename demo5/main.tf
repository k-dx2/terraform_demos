provider "azurerm" {
    features {}   
   

}

resource "azurerm_resource_group" "deploy1" {
    name = "Mytfrg1"
    location = "southindia"
  
}