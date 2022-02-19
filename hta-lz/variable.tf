variable "resource_group_name" {
description = "Default resource group name that the network will be created in."
type        = list
default     = ["landing-zone-rg","connectivity-rg","identity-rg","management-rg","sandbox-rg"]
}

variable "location" {
description = "The location/region where the core network will be created."
default     = "uksouth"
}

variable "lz_resource_group_name"{
    description = "Landing Zones Resource Group"
    type        = string
    default     = "landing-zone-rg"
}

variable "lz_storage_account_name"{
    description = "Landing Zones Storage Account"
    type        = string
    default     = "htalzstorage"
}