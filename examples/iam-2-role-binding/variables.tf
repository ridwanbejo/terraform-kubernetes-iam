variable "kube_service_accounts" {
  type    = list(any)
  default = []
}

variable "kube_roles" {
  type    = list(any)
  default = []
}

variable "kube_role_bindings" {
  type    = list(any)
  default = []
}
