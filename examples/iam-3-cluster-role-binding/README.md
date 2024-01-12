# Cluster Role binding example for Terraform-Kubernetes-IAM module

To run this example you need to execute:

```
$ terraform init
$ terraform plan
$ terraform apply
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.25.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tf_kube_iam"></a> [tf\_kube\_iam](#module\_tf\_kube\_iam) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kube_cluster_role_bindings"></a> [kube\_cluster\_role\_bindings](#input\_kube\_cluster\_role\_bindings) | n/a | `list(any)` | `[]` | no |
| <a name="input_kube_cluster_roles"></a> [kube\_cluster\_roles](#input\_kube\_cluster\_roles) | n/a | `list(any)` | `[]` | no |
| <a name="input_kube_service_accounts"></a> [kube\_service\_accounts](#input\_kube\_service\_accounts) | n/a | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kube_service_accounts"></a> [kube\_service\_accounts](#output\_kube\_service\_accounts) | Current Kubernetes service accounts |
| <a name="output_kube_service_cluster_role_bindings"></a> [kube\_service\_cluster\_role\_bindings](#output\_kube\_service\_cluster\_role\_bindings) | Current Kubernetes cluster role bindingss |
| <a name="output_kube_service_cluster_roles"></a> [kube\_service\_cluster\_roles](#output\_kube\_service\_cluster\_roles) | Current Kubernetes cluster roles |
<!-- END_TF_DOCS -->
