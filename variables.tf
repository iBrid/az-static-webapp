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