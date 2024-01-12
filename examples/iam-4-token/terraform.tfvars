kube_service_accounts = [
  {
    metadata = {
      name        = "test-service-account-4"
      annotations = {}
      labels = {
        application = "test-app"
        environment = "sandbox"
      }
    }
  },
]

kube_token_requests = [
  {
    metadata = {
      name        = "test-service-account-4"
      annotations = {}
      labels = {
        application = "test-app"
        environment = "sandbox"
      }
    }
    spec = {
      audiences = [
        "api",
        "vault",
        "factors"
      ]
    }
  }
]
