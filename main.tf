resource "azurerm_cosmosdb_account" "dbaccount" {
  name                      = var.cosmosdb_account_name
  location                  = var.cosmosdb_account_location
  resource_group_name       = var.resourcegroup
  offer_type                = "Standard"
  kind                      = "MongoDB"
  enable_automatic_failover = true
  geo_location {
    location          = var.location
    failover_priority = 0
  }
  geo_location {
    location          = var.failover_location
    failover_priority = 1
  }
  
  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }
}
resource "azurerm_cosmosdb_mongo_database" "mongodb" {
  name                = var.mongodb_name
  resource_group_name = var.resourcegroup
  account_name        = azurerm_cosmosdb_account.dbaccount.name
  throughput          = 400
}