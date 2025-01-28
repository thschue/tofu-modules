# talos-cluster

<!-- BEGINNING OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.17.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.2.3 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 0.70.0 |
| <a name="requirement_talos"></a> [talos](#requirement\_talos) | 0.7.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cilium"></a> [cilium](#module\_cilium) | github.com/thschue/tofu-modules//modules/cilium | v0.0.3 |
| <a name="module_cluster-1"></a> [cluster-1](#module\_cluster-1) | github.com/thschue/tofu-modules//modules/talos-proxmox-cluster | v0.0.3 |

## Resources

| Name | Type |
|------|------|
| [null_resource.wait_for_cluster](https://registry.terraform.io/providers/hashicorp/null/3.2.3/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_wait_for_cluster_cmd"></a> [wait\_for\_cluster\_cmd](#input\_wait\_for\_cluster\_cmd) | Custom local-exec command to execute for determining if the Talos cluster is healthy. Cluster endpoint will be available as an environment variable called ENDPOINT | `string` | `"for i in `seq 1 60`; do curl -k -o /dev/null -s -w '%{http_code}' $ENDPOINT/healthz | grep -q '401' && exit 0 || true; sleep 5; done; echo TIMEOUT && exit 1"` | no |
| <a name="input_wait_for_cluster_interpreter"></a> [wait\_for\_cluster\_interpreter](#input\_wait\_for\_cluster\_interpreter) | Custom local-exec command line interpreter for the command to determining if the eks cluster is healthy. | `list(string)` | <pre>[<br/>  "/bin/sh",<br/>  "-c"<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | n/a |
<!-- END OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
