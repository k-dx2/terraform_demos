provider "azurerm" {
    features{}  
}

variable "rloc" {
    type = list
    default = ["uksouth" , "eastus" , "southindia"]
}

resource "azurerm_resource_group" "dep1" {
    
    location = var.rloc[1]
    name     = "myrg1"
}