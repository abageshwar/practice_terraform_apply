# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "location" {
  type        = string
  default     = "westus2"
  description = "Resource group location"
}

variable "resourcegroup" {
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


variable "cosmosdb_sqldb_name" {
  type        = string
  default     = "arv-sqldb-name"
  description = "value"
}

variable "sql_container_name" {
  type        = string
  default     = "arv-sql-container"
  description = "SQL API container name."
}

variable "throughput" {
  type        = number
  default     = 400
  description = "Cosmos db database throughput"
  validation {
    condition     = var.throughput >= 400 && var.throughput <= 1000000
    error_message = "Cosmos db manual throughput should be equal to or greater than 400 and less than or equal to 1000000."
  }
  validation {
    condition     = var.throughput % 100 == 0
    error_message = "Cosmos db throughput should be in increments of 100."
  }
}