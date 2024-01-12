output "kube_service_accounts" {
  description = "Current Kubernetes service accounts"
  value       = module.tf_kube_iam.kubernetes_service_accounts
}

output "kube_token_requests" {
  description = "Current Kubernetes token requests"
  value       = module.tf_kube_iam.kubernetes_token_requests
  sensitive   = true
}
