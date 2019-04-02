# Resource Group
variable "resource_group_name"{
  default = "vijayresourcegroup"
}
variable "resource_group_name_2"{
  default = "nikitresourcegroup"
}
variable "azurerm_virtual_network"{
  default = ["10.0.0.0/16"]
}
variable "azurerm_subnet"{
  default = "10.0.2.0/24"
}