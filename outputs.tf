output "admin_client_certificate" {
  description = "The `client_certificate` in the `azurerm_kubernetes_cluster`'s `kube_admin_config` block.  Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster."
  sensitive   = true
  value       = try(azurerm_kubernetes_cluster.main.kube_admin_config[0].client_certificate, "")
}

output "admin_client_key" {
  description = "The `client_key` in the `azurerm_kubernetes_cluster`'s `kube_admin_config` block. Base64 encoded private key used by clients to authenticate to the Kubernetes cluster."
  sensitive   = true
  value       = try(azurerm_kubernetes_cluster.main.kube_admin_config[0].client_key, "")
}

output "admin_cluster_ca_certificate" {
  description = "The `cluster_ca_certificate` in the `azurerm_kubernetes_cluster`'s `kube_admin_config` block. Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster."
  sensitive   = true
  value       = try(azurerm_kubernetes_cluster.main.kube_admin_config[0].cluster_ca_certificate, "")
}

output "admin_host" {
  description = "The `host` in the `azurerm_kubernetes_cluster`'s `kube_admin_config` block. The Kubernetes cluster server host."
  sensitive   = true
  value       = try(azurerm_kubernetes_cluster.main.kube_admin_config[0].host, "")
}

output "admin_password" {
  description = "The `password` in the `azurerm_kubernetes_cluster`'s `kube_admin_config` block. A password or token used to authenticate to the Kubernetes cluster."
  sensitive   = true
  value       = try(azurerm_kubernetes_cluster.main.kube_admin_config[0].password, "")
}

output "admin_username" {
  description = "The `username` in the `azurerm_kubernetes_cluster`'s `kube_admin_config` block. A username used to authenticate to the Kubernetes cluster."
  sensitive   = true
  value       = try(azurerm_kubernetes_cluster.main.kube_admin_config[0].username, "")
}

output "aks_id" {
  description = "The `azurerm_kubernetes_cluster`'s id."
  value       = azurerm_kubernetes_cluster.main.id
}

output "aks_name" {
  description = "The `aurerm_kubernetes-cluster`'s name."
  value       = azurerm_kubernetes_cluster.main.name
}
