# cilium

<!-- BEGINNING OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.17.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.17.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.cilium](https://registry.terraform.io/providers/hashicorp/helm/2.17.0/docs/resources/release) | resource |
| [helm_release.cilium_config](https://registry.terraform.io/providers/hashicorp/helm/2.17.0/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_ingress_controller"></a> [enable\_ingress\_controller](#input\_enable\_ingress\_controller) | Enable the Cilium ingress controller | `bool` | `false` | no |
| <a name="input_lb_config"></a> [lb\_config](#input\_lb\_config) | IP pool for the Cilium load balancer | <pre>object({<br/>    enabled = optional(bool, false)<br/>    cidr    = optional(string, "")<br/>  })</pre> | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace to deploy the Cilium Helm chart | `string` | `"kube-system"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
