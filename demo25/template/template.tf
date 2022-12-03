variable "rgname" {
    type = string
}
variable "rgloc" {
    type = string
}


resource "azurerm_resource_group" "dep1" {
  name     = var.rgname
  location = var.rgloc
}