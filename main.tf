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

resource "azurerm_cosmosdb_mongo_collection" "collection" {
  name                = var.mongodb_collection_name
  resource_group_name = var.resourcegroup
  account_name        = var.cosmosdb_account_name
  database_name       = azurerm_cosmosdb_mongo_database.mongodb.name

  default_ttl_seconds = "-1"
  throughput          = var.mongodb_throughput
  depends_on          = [azurerm_cosmosdb_mongo_database.mongodb]

  index {
    keys   = var.index_keys
    unique = var.index_unique
  }
}

resource "azurerm_kubernetes_cluster" "main" {
  name                = var.k8clustername
  location            = var.location
  resource_group_name = var.resourcegroup
  dns_prefix          = var.prefix
  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_B2s"
    os_disk_size_gb = 30
  }
  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  tags = {
    environment = "Demo"
  }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  
}