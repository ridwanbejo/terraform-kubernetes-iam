kube_service_accounts = [
  {
    metadata = {
      name        = "test-service-account-1"
      annotations = {}
      labels = {
        application = "test-app"
        environment = "sandbox"
      }
    }
  },
]
