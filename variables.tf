variable "service_accounts" {
  type = list(object({
    metadata = object({
      annotations = optional(map(any))
      labels      = optional(map(any))
      name        = string
      namespace   = optional(string)
    })

    secret = optional(list(object({
      name = optional(string)
    })))

    image_pull_secret = optional(list(object({
      name = optional(string)
    })))

    automount_service_account_token = optional(bool)
  }))
}

variable "token_requests" {
  type = list(object({
    metadata = object({
      annotations = optional(map(any))
      labels      = optional(map(any))
      name        = string
      namespace   = optional(string)
    })

    spec = optional(object({
      expiration_seconds = optional(number)
      audiences          = optional(list(string))

      bound_object_ref = optional(object({
        api_version = optional(string)
        kind        = optional(string)
        name        = optional(list(string))
        uid         = optional(list(string))
      }))
    }))
  }))
}

variable "cluster_roles" {
  type = list(object({
    metadata = object({
      annotations = optional(map(any))
      labels      = optional(map(any))
      name        = string
    })

    rule = optional(list(object({
      verbs             = list(string)
      api_groups        = optional(list(string))
      resources         = optional(list(string))
      resource_names    = optional(list(string))
      non_resource_urls = optional(list(string))
    })))

    aggregation_rule = optional(object({
      cluster_role_selectors = optional(object({
        match_labels = optional(map(string))
        match_expressions = optional(list(object({
          key      = optional(string)
          operator = optional(string)
          values   = optional(list(string))
        })))
      }))
    }))
  }))
}

variable "cluster_role_bindings" {
  type = list(object({
    metadata = object({
      annotations = optional(map(any))
      labels      = optional(map(any))
      name        = string
    })

    role_ref = object({
      api_group = string
      kind      = string
      name      = string
    })

    subject = list(object({
      name      = string
      namespace = optional(string)
      kind      = string
      api_group = optional(string)
    }))
  }))
}

variable "roles" {
  type = list(object({
    metadata = object({
      annotations = optional(map(any))
      labels      = optional(map(any))
      name        = string
      namespace   = optional(string)
    })

    rule = list(object({
      verbs          = list(string)
      api_groups     = optional(list(string))
      resources      = optional(list(string))
      resource_names = optional(list(string))
    }))
  }))
}

variable "role_bindings" {
  type = list(object({
    metadata = object({
      annotations = optional(map(any))
      labels      = optional(map(any))
      name        = string
      namespace   = optional(string)
    })

    role_ref = object({
      api_group = string
      kind      = string
      name      = string
    })

    subject = list(object({
      name      = string
      namespace = optional(string)
      kind      = string
      api_group = optional(string)
    }))
  }))
}
