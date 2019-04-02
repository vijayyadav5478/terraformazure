# Resourse Group
provider "azurerm" {
}
resource "azurerm_resource_group" "rg" {
        name = "${var.resource_group_name}"
        location = "Southeast Asia"
        tags {
        environment = "Terraform Demo"
    }
}
resource "azurerm_resource_group" "rg2" {
        name = "${var.resource_group_name_2}"
        location = "Southeast Asia"
        
        tags {
        environment = "Terraform Demo"
    }
}
# Create virtual network
resource "azurerm_virtual_network" "myterraformnetwork" {
    name                = "myVnet"
    address_space       = "${var.azurerm_virtual_network}"
    location            = "Southeast Asia"

    resource_group_name = "${azurerm_resource_group.rg.name}"

    tags {
        environment = "Terraform Demo"
    }
}
# Create Subnet
resource "azurerm_subnet" "myterraformsubnet" {
    name                 = "mySubnet"
    resource_group_name  = "${azurerm_resource_group.rg.name}"
    virtual_network_name = "${azurerm_virtual_network.myterraformnetwork.name}"
    address_prefix       = "${var.azurerm_subnet}"
}
# Create public IP address
resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = "myPublicIP"
    location                     = "Southeast Asia"
    resource_group_name          = "${azurerm_resource_group.rg.name}"
    allocation_method            = "Dynamic"

    tags {
        environment = "Terraform Demo"
    }
}
# Create Network Security Group
resource "azurerm_network_security_group" "myterraformnsg" {
    name                = "myNetworkSecurityGroup"
    location            = "Southeast Asia"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    
    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags {
        environment = "Terraform Demo"
    }
}