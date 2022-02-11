variable "resource_group_name" {
description = "Default resource group name that the network will be created in."
type        = list
default     = ["landing-zone-rg","connectivity-rg","identity-rg","management-rg","sandbox-rg"]
}

variable "location" {
description = "The location/region where the core network will be created."
default     = "uksouth"
}