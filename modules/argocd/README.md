# argocd

<!-- BEGINNING OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.17.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.35.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.17.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.35.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/2.17.0/docs/resources/release) | resource |
| [helm_release.argocd_app](https://registry.terraform.io/providers/hashicorp/helm/2.17.0/docs/resources/release) | resource |
| [kubernetes_secret.github_keys](https://registry.terraform.io/providers/hashicorp/kubernetes/2.35.1/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apps"></a> [apps](#input\_apps) | n/a | <pre>list(object({<br/>    name     = string<br/>    repo     = string<br/>    path     = optional(string, "/")<br/>    revision = optional(string, "HEAD")<br/>    project  = optional(string, "default")<br/>  }))</pre> | `[]` | no |
| <a name="input_argo_namespace"></a> [argo\_namespace](#input\_argo\_namespace) | n/a | `string` | `"argocd"` | no |
| <a name="input_projects"></a> [projects](#input\_projects) | n/a | `list(string)` | `[]` | no |
| <a name="input_repo_secrets"></a> [repo\_secrets](#input\_repo\_secrets) | n/a | <pre>list(object({<br/>    name     = string<br/>    repo     = string<br/>    username = string<br/>    token    = string<br/>  }))</pre> | `[]` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
