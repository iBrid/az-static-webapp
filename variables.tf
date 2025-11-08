variable "repository_branch" {
  type        = string
  description = "Branch in the repository to use for Static Web App builds"
  default     = "main"
}

variable "repository_token" {
  type        = string
  description = "Personal access token or deployment token for the repository. Store this as a sensitive variable in Terraform Cloud or as a local environment variable."
  sensitive   = true
}
#create variables for resource group name and location set resource group name to "StaticWebAppRG" and location to "West US 3
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "StaticWebAppRG"
}
variable "location" {
  description = "The Azure region where the resource group will be created"
  type        = string
  default     = "West US 3"
}

#create variable for virtual network name and address space set virtual network name to "StaticWebAppVNet"
variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "StaticWebAppVNet"
}

#create variable for subnet name set subnet name to "StaticWebAppSubnet"
variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "StaticWebAppSubnet"
}
#variable for the static web app name
variable "static_web_app_name" {
  description = "The name of the Azure Static Web App"
  type        = string
  default     = "MyStaticWebApp1"
}
