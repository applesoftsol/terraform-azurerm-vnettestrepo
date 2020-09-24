provider "azurerm" {
  version         = "=2.4.0"
  subscription_id = "08c435ca-c9ef-492c-956b-ac5e6de0c1bc"
  client_id       = "cc01fcc5-5574-4a99-8dd2-fb5a807580a7"
  client_secret   = "~1u-hdhggs.Zpe_6~2xQcpvlZF61Zjf1-Z"
  tenant_id       = "ecc704cd-2a5a-4cec-8de0-e59e54f2d7c3"
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = var.rg
  location = var.location
}

module "vnet" {
  source              = "Azure/vnet/azurerm"
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["14.0.0.0/16"]
  subnet_prefixes     = ["14.0.1.0/24", "14.0.2.0/24", "14.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]
}