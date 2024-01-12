output "kube_service_accounts" {
  description = "Current Kubernetes service accounts"
  value       = module.tf_kube_iam.kubernetes_service_accounts
}

output "kube_service_roles" {
  description = "Current Kubernetes roles"
  value       = module.tf_kube_iam.kubernetes_roles
}

output "kube_service_role_bindings" {
  description = "Current Kubernetes role bindingss"
  value       = module.tf_kube_iam.kubernetes_role_bindings
}
