# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "location" {
  type        = string
  default     = "westus2"
  description = "Resource group location"
}

variable "failover_location" {
  default = "westus"
}
variable "resourcegroup"  {
  type        = string
  default     = "iacteam2-arv"
  description = "Resource group name"
}

variable "storageaccount" {
  type        = string
  default     = "arvstorageaccount"
  description = "Storage account name"
}
variable "azurerm_storage_container" {
  type        = string
  default     = "tfstate"
  description = "Storage account name"
}


variable "cosmosdb_account_name" {
  type        = string
  default     = "arv-cosmos-db"
  description = "Cosmos db account name"
}


variable "cosmosdb_account_location" {
  type        = string
  default     = "westus2"
  description = "Cosmos db account location"
}


variable "mongodb_name" {
  type        = string
  default     = "arv-mongodb"
  description = "value"
}

