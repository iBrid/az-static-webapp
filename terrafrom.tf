terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }

  cloud {
    organization = "DatacentR"
    workspaces {
      name = "az_static_web_app"
    }
  }
}