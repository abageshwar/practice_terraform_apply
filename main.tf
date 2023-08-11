resource "azurerm_resource_group" "rg" {
  name     = var.resourcegroup
  location = var.location
}
resource "azurerm_storage_account" "rg" {
  name                     = var.storageaccount
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    environment = "staging"
  }
}
resource "azurerm_storage_container" "rg" {
  name                  = var.azurerm_storage_container
  storage_account_name  = azurerm_storage_account.rg.name
  container_access_type = "private"
}
resource "azurerm_cosmosdb_account" "dbaccount" {
  name                      = var.cosmosdb_account_name
  location                  = var.cosmosdb_account_location
  resource_group_name       = azurerm_resource_group.rg.name
  offer_type                = "Standard"
  kind                      = "GlobalDocumentDB"
  enable_automatic_failover = false
  geo_location {
    location          = var.location
    failover_priority = 0
  }
  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }
  depends_on = [
    resource_group_name.azurerm_resource_group.rg
  ]
}
resource "azurerm_cosmosdb_sql_database" "sqldb" {
  name                = var.cosmosdb_sqldb_name
  resource_group_name = var.resourcegroup
  account_name        = azurerm_cosmosdb_account.dbaccount.name
  throughput          = var.throughput
}
resource "azurerm_cosmosdb_sql_container" "main" {
  name                  = var.sql_container_name
  resource_group_name   = var.resourcegroup
  account_name          = azurerm_cosmosdb_account.dbaccount.name
  database_name         = azurerm_cosmosdb_sql_database.sqldb.name
  partition_key_path    = "/definition/id"
  partition_key_version = 1
  throughput            = var.throughput
  
  indexing_policy {
    indexing_mode = "consistent"

    included_path {
      path = "/*"
    }

    included_path {
      path = "/included/?"
    }

    excluded_path {
      path = "/excluded/?"
    }
  }

  unique_key {
    paths = ["/definition/idlong", "/definition/idshort"]
  }
}


