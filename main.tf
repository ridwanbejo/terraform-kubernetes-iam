resource "kubernetes_service_account_v1" "service_accounts" {
  for_each = { for key, item in var.service_accounts : item.metadata.name => item }

  metadata {
    name        = each.value.metadata.name
    annotations = each.value.metadata.annotations
    labels      = each.value.metadata.labels
    namespace   = each.value.metadata.namespace
  }

  dynamic "secret" {
    for_each = (each.value.secret != null ? each.value.secret : [])
    content {
      name = secret.value["name"]
    }
  }

  dynamic "image_pull_secret" {
    for_each = (each.value.image_pull_secret != null ? each.value.image_pull_secret : [])
    content {
      name = image_pull_secret.value["name"]
    }
  }

  automount_service_account_token = each.value.automount_service_account_token
}

resource "kubernetes_token_request_v1" "tokens" {
  for_each = { for key, item in var.token_requests : item.metadata.name => item }

  metadata {
    name        = each.value.metadata.name
    annotations = each.value.metadata.annotations
    labels      = each.value.metadata.labels
    namespace   = each.value.metadata.namespace
  }
  spec {
    audiences          = each.value.spec.audiences
    expiration_seconds = try(each.value.expiration_seconds, 31536000)

    bound_object_ref {
      api_version = try(each.value.spec.bound_object_ref.api_version, "")
      kind        = try(each.value.spec.bound_object_ref.kind, "")
      name        = try(each.value.spec.bound_object_ref.name, "")
      uid         = try(each.value.spec.bound_object_ref.uid, "")
    }
  }

  depends_on = [kubernetes_service_account_v1.service_accounts]
}

resource "kubernetes_cluster_role_v1" "cluster_roles" {
  for_each = { for key, item in var.cluster_roles : item.metadata.name => item }

  metadata {
    name        = each.value.metadata.name
    annotations = each.value.metadata.annotations
    labels      = each.value.metadata.labels
  }

  dynamic "rule" {
    for_each = (each.value.rule != null ? each.value.rule : [])

    content {
      verbs             = rule.value["verbs"]
      api_groups        = rule.value["api_groups"]
      resources         = rule.value["resources"]
      resource_names    = rule.value["resource_names"]
      non_resource_urls = rule.value["non_resource_urls"]
    }
  }

  aggregation_rule {
    cluster_role_selectors {
      match_labels = each.value.aggregation_rule.cluster_role_selectors.match_labels

      dynamic "match_expressions" {
        for_each = (each.value.aggregation_rule.cluster_role_selectors.match_expressions != null ? each.value.aggregation_rule.cluster_role_selectors.match_expressions : [])
        content {
          key      = match_expression.value["key"]
          operator = match_expression.value["operator"]
          values   = match_expression.value["values"]
        }
      }
    }
  }
}

resource "kubernetes_cluster_role_binding_v1" "cluster_role_bindings" {
  for_each = { for key, item in var.cluster_role_bindings : item.metadata.name => item }

  metadata {
    name        = each.value.metadata.name
    annotations = each.value.metadata.annotations
    labels      = each.value.metadata.labels
  }

  role_ref {
    api_group = each.value.role_ref.api_group
    kind      = each.value.role_ref.kind
    name      = each.value.role_ref.name
  }

  dynamic "subject" {
    for_each = (each.value.subject != null ? each.value.subject : [])

    content {
      kind      = subject.value["kind"]
      name      = subject.value["name"]
      api_group = subject.value["api_group"]
      namespace = subject.value["namespace"]
    }
  }

  depends_on = [kubernetes_cluster_role_v1.cluster_roles, kubernetes_service_account_v1.service_accounts]
}

resource "kubernetes_role_v1" "roles" {
  for_each = { for key, item in var.roles : item.metadata.name => item }

  metadata {
    name        = each.value.metadata.name
    annotations = each.value.metadata.annotations
    labels      = each.value.metadata.labels
    namespace   = each.value.metadata.namespace
  }

  dynamic "rule" {
    for_each = (each.value.rule != null ? each.value.rule : [])

    content {
      verbs          = rule.value["verbs"]
      api_groups     = rule.value["api_groups"]
      resources      = rule.value["resources"]
      resource_names = rule.value["resource_names"]
    }
  }
}

resource "kubernetes_role_binding_v1" "role_bindings" {
  for_each = { for key, item in var.role_bindings : item.metadata.name => item }

  metadata {
    name        = each.value.metadata.name
    annotations = each.value.metadata.annotations
    labels      = each.value.metadata.labels
    namespace   = each.value.metadata.namespace
  }

  role_ref {
    api_group = each.value.role_ref.api_group
    kind      = each.value.role_ref.kind
    name      = each.value.role_ref.name
  }

  dynamic "subject" {
    for_each = (each.value.subject != null ? each.value.subject : [])

    content {
      kind      = subject.value["kind"]
      name      = subject.value["name"]
      api_group = subject.value["api_group"]
      namespace = subject.value["namespace"]
    }
  }

  depends_on = [kubernetes_role_v1.roles, kubernetes_service_account_v1.service_accounts]
}
