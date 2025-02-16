# gcp_vault_kms

<!-- BEGINNING OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 6.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_kms_crypto_key.vault_key](https://registry.terraform.io/providers/hashicorp/google/6.20.0/docs/resources/kms_crypto_key) | resource |
| [google_kms_crypto_key_iam_binding.vault_kms_admins](https://registry.terraform.io/providers/hashicorp/google/6.20.0/docs/resources/kms_crypto_key_iam_binding) | resource |
| [google_kms_crypto_key_iam_binding.vault_kms_permissions](https://registry.terraform.io/providers/hashicorp/google/6.20.0/docs/resources/kms_crypto_key_iam_binding) | resource |
| [google_kms_crypto_key_iam_binding.vault_kms_viewer](https://registry.terraform.io/providers/hashicorp/google/6.20.0/docs/resources/kms_crypto_key_iam_binding) | resource |
| [google_kms_key_ring.vault_ring](https://registry.terraform.io/providers/hashicorp/google/6.20.0/docs/resources/kms_key_ring) | resource |
| [google_service_account.vault_sa](https://registry.terraform.io/providers/hashicorp/google/6.20.0/docs/resources/service_account) | resource |
| [google_service_account_key.service_account_key](https://registry.terraform.io/providers/hashicorp/google/6.20.0/docs/resources/service_account_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_key_admins"></a> [key\_admins](#input\_key\_admins) | The list of users who can manage the key | `list(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location of the KMS | `string` | `"europe-west1"` | no |
| <a name="input_project"></a> [project](#input\_project) | The project where the KMS runs | `string` | n/a | yes |
| <a name="input_vault_name"></a> [vault\_name](#input\_vault\_name) | The name of the OpenBao instance | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_crypto_key"></a> [crypto\_key](#output\_crypto\_key) | n/a |
| <a name="output_key_ring"></a> [key\_ring](#output\_key\_ring) | n/a |
| <a name="output_service_account_key"></a> [service\_account\_key](#output\_service\_account\_key) | n/a |
<!-- END OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
