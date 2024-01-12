variable "kube_service_accounts" {
  type    = list(any)
  default = []
}

variable "kube_cluster_roles" {
  type    = list(any)
  default = []
}

variable "kube_cluster_role_bindings" {
  type    = list(any)
  default = []
}
