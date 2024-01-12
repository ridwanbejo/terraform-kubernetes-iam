
# Terraform-Kubernetes-IAM module

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.25.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.25.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_cluster_role_binding_v1.cluster_role_bindings](https://registry.terraform.io/providers/hashicorp/kubernetes/2.25.1/docs/resources/cluster_role_binding_v1) | resource |
| [kubernetes_cluster_role_v1.cluster_roles](https://registry.terraform.io/providers/hashicorp/kubernetes/2.25.1/docs/resources/cluster_role_v1) | resource |
| [kubernetes_role_binding_v1.role_bindings](https://registry.terraform.io/providers/hashicorp/kubernetes/2.25.1/docs/resources/role_binding_v1) | resource |
| [kubernetes_role_v1.roles](https://registry.terraform.io/providers/hashicorp/kubernetes/2.25.1/docs/resources/role_v1) | resource |
| [kubernetes_service_account_v1.service_accounts](https://registry.terraform.io/providers/hashicorp/kubernetes/2.25.1/docs/resources/service_account_v1) | resource |
| [kubernetes_token_request_v1.tokens](https://registry.terraform.io/providers/hashicorp/kubernetes/2.25.1/docs/resources/token_request_v1) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_role_bindings"></a> [cluster\_role\_bindings](#input\_cluster\_role\_bindings) | n/a | <pre>list(object({<br>    metadata = object({<br>      annotations = optional(map(any))<br>      labels      = optional(map(any))<br>      name        = string<br>    })<br><br>    role_ref = object({<br>      api_group = string<br>      kind      = string<br>      name      = string <br>    })<br><br>    subject = list(object({<br>      name      = string<br>      namespace = optional(string)<br>      kind      = string<br>      api_group = optional(string)<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_cluster_roles"></a> [cluster\_roles](#input\_cluster\_roles) | n/a | <pre>list(object({<br>    metadata = object({<br>      annotations = optional(map(any))<br>      labels      = optional(map(any))<br>      name        = string<br>    })<br><br>    rule = optional(list(object({<br>      verbs             = list(string)<br>      api_groups        = optional(list(string))<br>      resources         = optional(list(string))<br>      resource_names    = optional(list(string))<br>      non_resource_urls = optional(list(string))<br>    })))<br><br>    aggregation_rule = optional(object({<br>      cluster_role_selectors = optional(object({<br>        match_labels = optional(map(string))<br>        match_expressions = optional(list(object({<br>          key = optional(string)<br>          operator = optional(string)<br>          values = optional(list(string))<br>        })))<br>      }))<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_role_bindings"></a> [role\_bindings](#input\_role\_bindings) | n/a | <pre>list(object({<br>    metadata = object({<br>      annotations = optional(map(any))<br>      labels      = optional(map(any))<br>      name        = string<br>      namespace   = optional(string)<br>    })<br><br>    role_ref = object({<br>      api_group = string<br>      kind      = string<br>      name      = string <br>    })<br><br>    subject = list(object({<br>      name      = string<br>      namespace = optional(string)<br>      kind      = string<br>      api_group = optional(string)<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_roles"></a> [roles](#input\_roles) | n/a | <pre>list(object({<br>    metadata = object({<br>      annotations = optional(map(any))<br>      labels      = optional(map(any))<br>      name        = string<br>      namespace   = optional(string)<br>    })<br><br>    rule = list(object({<br>      verbs             = list(string)<br>      api_groups        = optional(list(string))<br>      resources         = optional(list(string))<br>      resource_names    = optional(list(string))<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_service_accounts"></a> [service\_accounts](#input\_service\_accounts) | n/a | <pre>list(object({<br>    metadata = object({<br>      annotations = optional(map(any))<br>      labels      = optional(map(any))<br>      name        = string<br>      namespace   = optional(string)<br>    })<br><br>    secret = optional(list(object({<br>      name = optional(string)<br>    })))<br><br>    image_pull_secret = optional(list(object({<br>      name = optional(string)<br>    })))<br><br>    automount_service_account_token = optional(bool)<br>  }))</pre> | n/a | yes |
| <a name="input_token_requests"></a> [token\_requests](#input\_token\_requests) | n/a | <pre>list(object({<br>    metadata = object({<br>      annotations = optional(map(any))<br>      labels      = optional(map(any))<br>      name        = string<br>      namespace   = optional(string)<br>    })<br><br>    spec = optional(object({<br>      expiration_seconds = optional(number)<br>      audiences          = optional(list(string))<br><br>      bound_object_ref = optional(object({<br>        api_version = optional(string)<br>        kind        = optional(string)<br>        name        = optional(list(string))<br>        uid         = optional(list(string))<br>      }))<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubernetes_cluster_role_bindings"></a> [kubernetes\_cluster\_role\_bindings](#output\_kubernetes\_cluster\_role\_bindings) | List of Kubernetes cluster role bindings |
| <a name="output_kubernetes_cluster_roles"></a> [kubernetes\_cluster\_roles](#output\_kubernetes\_cluster\_roles) | List of Kubernetes cluster roles |
| <a name="output_kubernetes_role_bindings"></a> [kubernetes\_role\_bindings](#output\_kubernetes\_role\_bindings) | List of Kubernetes role bindings |
| <a name="output_kubernetes_roles"></a> [kubernetes\_roles](#output\_kubernetes\_roles) | List of Kubernetes roles |
| <a name="output_kubernetes_service_accounts"></a> [kubernetes\_service\_accounts](#output\_kubernetes\_service\_accounts) | List of Kubernetes service accounts |
| <a name="output_kubernetes_token_requests"></a> [kubernetes\_token\_requests](#output\_kubernetes\_token\_requests) | List of Kubernetes token requests |
<!-- END_TF_DOCS -->
