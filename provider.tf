# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0


terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.68.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "iacteam2-arv"
    storage_account_name = "arvstorageaccount"
    container_name       = "tfstate"
    key                  = "dev-terraform.tfstate"
  }

  
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}






