# talos-proxmox-cluster

<!-- BEGINNING OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 0.70.1 |
| <a name="requirement_talos"></a> [talos](#requirement\_talos) | 0.7.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 0.70.1 |
| <a name="provider_talos"></a> [talos](#provider\_talos) | 0.7.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_virtual_environment_vm.talos-vm-cp](https://registry.terraform.io/providers/bpg/proxmox/0.70.1/docs/resources/virtual_environment_vm) | resource |
| [proxmox_virtual_environment_vm.talos-vm-node](https://registry.terraform.io/providers/bpg/proxmox/0.70.1/docs/resources/virtual_environment_vm) | resource |
| [talos_cluster_kubeconfig.this](https://registry.terraform.io/providers/siderolabs/talos/0.7.1/docs/resources/cluster_kubeconfig) | resource |
| [talos_machine_bootstrap.control_plane](https://registry.terraform.io/providers/siderolabs/talos/0.7.1/docs/resources/machine_bootstrap) | resource |
| [talos_machine_configuration_apply.control_plane](https://registry.terraform.io/providers/siderolabs/talos/0.7.1/docs/resources/machine_configuration_apply) | resource |
| [talos_machine_configuration_apply.node](https://registry.terraform.io/providers/siderolabs/talos/0.7.1/docs/resources/machine_configuration_apply) | resource |
| [talos_machine_secrets.talos](https://registry.terraform.io/providers/siderolabs/talos/0.7.1/docs/resources/machine_secrets) | resource |
| [talos_machine_configuration.controller](https://registry.terraform.io/providers/siderolabs/talos/0.7.1/docs/data-sources/machine_configuration) | data source |
| [talos_machine_configuration.node](https://registry.terraform.io/providers/siderolabs/talos/0.7.1/docs/data-sources/machine_configuration) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | `"dev-cluster"` | no |
| <a name="input_network_bridges"></a> [network\_bridges](#input\_network\_bridges) | n/a | <pre>object({<br/>    default      = string<br/>    default_vlan = optional(number, 0)<br/>    storage      = string<br/>  })</pre> | n/a | yes |
| <a name="input_network_config"></a> [network\_config](#input\_network\_config) | n/a | <pre>object({<br/>    dns_servers = list(string)<br/>    domain      = string<br/>    gateway     = string<br/>  })</pre> | n/a | yes |
| <a name="input_proxmox"></a> [proxmox](#input\_proxmox) | n/a | <pre>object({<br/>    control_plane_datastore = optional(string, "local-lvm")<br/>    node_datastore          = optional(string, "local-lvm")<br/>    machines                = list(string)<br/>  })</pre> | n/a | yes |
| <a name="input_talos_control_plane"></a> [talos\_control\_plane](#input\_talos\_control\_plane) | n/a | <pre>object({<br/>    static_networking   = optional(bool, false)<br/>    version             = optional(string, "1.9.1")<br/>    nodes               = optional(number, 3)<br/>    cluster_subnet      = string<br/>    cluster_subnet_cidr = optional(number, 24)<br/>    first_id            = number<br/>  })</pre> | n/a | yes |
| <a name="input_talos_network"></a> [talos\_network](#input\_talos\_network) | n/a | <pre>object({<br/>    subnet      = string<br/>    subnet_cidr = optional(number, 24)<br/>  })</pre> | n/a | yes |
| <a name="input_talos_node"></a> [talos\_node](#input\_talos\_node) | n/a | <pre>object({<br/>    static_networking   = optional(bool, false)<br/>    version             = optional(string, "1.9.1")<br/>    nodes               = optional(number, 3)<br/>    cluster_subnet      = string<br/>    cluster_subnet_cidr = optional(number, 24)<br/>    first_id            = number<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | n/a |
| <a name="output_kubeconfig_file"></a> [kubeconfig\_file](#output\_kubeconfig\_file) | n/a |
<!-- END OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
