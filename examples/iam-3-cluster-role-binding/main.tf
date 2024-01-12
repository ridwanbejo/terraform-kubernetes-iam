module "tf_kube_iam" {
  source = "../../"

  service_accounts      = var.kube_service_accounts
  token_requests        = []
  cluster_roles         = var.kube_cluster_roles
  cluster_role_bindings = var.kube_cluster_role_bindings
  roles                 = []
  role_bindings         = []
}
