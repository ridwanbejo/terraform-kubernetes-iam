output "kubernetes_service_accounts" {
  description = "List of Kubernetes service accounts"
  value       = { for key, item in var.service_accounts : item.metadata.name => item }
}

output "kubernetes_token_requests" {
  description = "List of Kubernetes token requests"
  value       = { for key, item in var.token_requests : item.metadata.name => item }
  sensitive   = true
}

output "kubernetes_cluster_roles" {
  description = "List of Kubernetes cluster roles"
  value       = { for key, item in var.cluster_roles : item.metadata.name => item }
}

output "kubernetes_cluster_role_bindings" {
  description = "List of Kubernetes cluster role bindings"
  value       = { for key, item in var.cluster_role_bindings : item.metadata.name => item }
}

output "kubernetes_roles" {
  description = "List of Kubernetes roles"
  value       = { for key, item in var.roles : item.metadata.name => item }
}

output "kubernetes_role_bindings" {
  description = "List of Kubernetes role bindings"
  value       = { for key, item in var.role_bindings : item.metadata.name => item }
}
