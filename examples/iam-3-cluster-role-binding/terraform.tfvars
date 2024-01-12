kube_service_accounts = [
  {
    metadata = {
      name        = "test-service-account-3"
      namespace   = "default"
      annotations = {}
      labels = {
        application = "test-app"
        environment = "sandbox"
      }
    }
  },
]

kube_cluster_roles = [{
  metadata = {
    name = "test-cluster-role-1"
    labels = {
      test        = "my-cluster-role"
      application = "test-app"
      environment = "sandbox"
    }
  }
  rule = [{
    api_groups = [""]
    resources  = ["namespace, pods"]
    verbs      = ["get", "list", "watch"]
  }]
  aggregation_rule = {
    cluster_role_selectors = {
      match_labels      = {}
      match_expressions = []
    }
  }
}]

kube_cluster_role_bindings = [{
  metadata = {
    name = "test-cluster-role-binding-1"
    labels = {
      test        = "my-cluster-role"
      application = "test-app"
      environment = "sandbox"
    }
  }

  role_ref = {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "test-cluster-role-1"
  }
  subject = [{
    kind      = "ServiceAccount"
    name      = "test-service-account-3"
    namespace = "default"
  }]
}]
