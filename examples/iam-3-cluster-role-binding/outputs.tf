output "kube_service_accounts" {
  description = "Current Kubernetes service accounts"
  value       = module.tf_kube_iam.kubernetes_service_accounts
}

output "kube_service_cluster_roles" {
  description = "Current Kubernetes cluster roles"
  value       = module.tf_kube_iam.kubernetes_cluster_roles
}

output "kube_service_cluster_role_bindings" {
  description = "Current Kubernetes cluster role bindingss"
  value       = module.tf_kube_iam.kubernetes_cluster_role_bindings
}
