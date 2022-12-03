provider "azurerm" {
    features{}  
}
variable "rgname" {
    type=string
    default="demorg"
  
}
resource "azurerm_resource_group" "deploy1" {
    
    location = "eastus"
    name     = var.rgname
}