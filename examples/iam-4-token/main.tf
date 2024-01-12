module "tf_kube_iam" {
  source = "../../"

  service_accounts      = var.kube_service_accounts
  token_requests        = var.kube_token_requests
  cluster_roles         = []
  cluster_role_bindings = []
  roles                 = []
  role_bindings         = []
}
