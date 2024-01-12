module "tf_kube_iam" {
  source = "../../"

  service_accounts      = var.kube_service_accounts
  token_requests        = []
  cluster_roles         = []
  cluster_role_bindings = []
  roles                 = var.kube_roles
  role_bindings         = var.kube_role_bindings
}
