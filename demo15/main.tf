provider "azurerm" {
    features{}  
}


resource "azurerm_resource_group" "dep1" {
    count = 4
    
    location = "eastus"
    name     = "myrg-${count.index}"
}