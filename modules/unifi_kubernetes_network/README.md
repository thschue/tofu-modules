# argocd

<!-- BEGINNING OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_unifi"></a> [unifi](#requirement\_unifi) | 0.41.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_unifi"></a> [unifi](#provider\_unifi) | 0.41.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [unifi_network.k8s_nodes](https://registry.terraform.io/providers/ubiquiti-community/unifi/0.41.2/docs/resources/network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the cluster | `string` | n/a | yes |
| <a name="input_node_network"></a> [node\_network](#input\_node\_network) | The network configuration for the nodes | <pre>object({<br/>    subnet = string<br/>    vlan   = number<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_node_network"></a> [node\_network](#output\_node\_network) | n/a |
<!-- END OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
