kube_service_accounts = [
  {
    metadata = {
      name        = "test-service-account-2"
      namespace   = "default"
      annotations = {}
      labels = {
        application = "test-app"
        environment = "sandbox"
      }
    }
  },
]

kube_roles = [{
  metadata = {
    name      = "test-role-1"
    namespace = "default"
    labels = {
      test        = "my-role"
      application = "test-app"
      environment = "sandbox"
    }
  }
  rule = [{
    api_groups     = [""]
    resources      = ["pods"]
    resource_names = ["foo"]
    verbs          = ["get", "list", "watch"]
    },
    {
      api_groups     = ["apps"]
      resources      = ["deployments"]
      verbs          = ["get", "list"]
      resource_names = []
  }]
}]

kube_role_bindings = [{
  metadata = {
    name      = "test-role-binding-1"
    namespace = "default"
    labels = {
      test        = "my-role"
      application = "test-app"
      environment = "sandbox"
    }
  }

  role_ref = {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "test-role-1"
  }
  subject = [{
    kind      = "ServiceAccount"
    name      = "test-service-account-2"
    namespace = "default"
  }]
}]
