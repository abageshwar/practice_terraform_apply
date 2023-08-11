# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
variable "subscription_id" {
  type        = string
  default     = "2d2bdb15-b610-43e6-9d32-b9f1553a103e"
  description = "Subscription ID"
}
variable "tenant_id" {
  type        = string
  default     = "ee69be27-d938-4eb5-8711-c5e69ca43718"
  description = "Tenant ID"
}

variable "client_id" {
  type        = string
  default     = "34f4a14e-53a4-4e15-8104-caf0c6ce3e89"
  description = "Client ID"
}
variable "client_secret" {
  type        = string
  default     = "y0J8Q~30k2_cgUoRYtj4xUqygPSW6mRuy77E2aXs"
  description = "Client Secret"
}



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

variable "k8clustername" {
  type        = string
  default     = "arvaks"
  description = "Kubernetes Cluster Name"
}

variable "prefix" {
  type        = string
  default     = "arvdns"
  description = "Kubernetes DNS Name"
}

variable "role_based_access_control" {
  type        = bool
  default     = false
  description = "Enable Role Based Access Control."
  nullable    = false
}
