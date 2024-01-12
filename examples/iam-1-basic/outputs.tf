output "kube_service_accounts" {
  description = "Current Kubernetes service accounts"
  value       = module.tf_kube_iam.kubernetes_service_accounts
}
