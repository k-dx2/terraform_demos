provider "azurerm" {
    features{}
}

module "devmodule" {
    source="./envs/dev"
  
}
module "prodmodule" {
    source="./envs/prod"
}