resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = ["172.16.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    environment = "Development"
  }
}


#create a subnet within the virtual network with the name "StaticWebAppSubnet" and address prefix "
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["172.16.1.0/24"]
}

#add the static web app resource
resource "azurerm_static_web_app" "static_web_app" {
  name                = var.static_web_app_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_tier            = "Free"
  repository_url      = "https://github.com/iBrid/my_webpage.git"
  # branch can be configured for VCS integration if supported by your provider / workflow
  repository_branch   = var.repository_branch
  repository_token    = var.repository_token

  identity {
    type = "SystemAssigned"
  }
  depends_on = [azurerm_subnet.subnet]
  tags = {
    environment = "Development"
  }
}

output "static_web_app_default_hostname" {
  description = "Default hostname for the Static Web App"
  value       = azurerm_static_web_app.static_web_app.default_hostname
}