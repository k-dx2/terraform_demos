provider "azurerm" {
    features{}  
}


resource "azurerm_resource_group" "dep1" {  
    
    location = "eastus"
    name     = "myrg1"
}

output "outvar1" {
    value = azurerm_resource_group.dep1.id
}