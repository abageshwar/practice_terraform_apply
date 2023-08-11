# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  backend "azurerm" {
    resource_group_name  = "iacteam2resourcegrp"
    storage_account_name = "arvcosmosdbtfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.68.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "2d2bdb15-b610-43e6-9d32-b9f1553a103e"
  tenant_id       = "ee69be27-d938-4eb5-8711-c5e69ca43718"
  client_id       = "34f4a14e-53a4-4e15-8104-caf0c6ce3e89"
  client_secret   = "y0J8Q~30k2_cgUoRYtj4xUqygPSW6mRuy77E2aXs"
}






