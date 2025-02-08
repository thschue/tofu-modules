data "talos_machine_configuration" "node" {
  count            = var.talos_node.nodes
  cluster_name     = var.cluster_name
  cluster_endpoint = "https://${local.vip_ip}:6443"
  machine_secrets  = talos_machine_secrets.talos.machine_secrets
  machine_type     = "worker"
  talos_version    = "v${var.talos_node.version}"
  config_patches = [
    yamlencode({
      machine = {
        kubelet = {
          nodeIP = {
            validSubnets = [
              var.talos_node.subnet,
            ]
          }
        },
        network = {
          interfaces = [
            # see https://www.talos.dev/v1.8/talos-guides/network/vip/
            {
              interface = "eth1"
              addresses = ["${cidrhost(var.talos_node.cluster_subnet, count.index + 3)}/${var.talos_node.cluster_subnet_cidr}"]
            }
          ]
        }
      }
    }),
  ]
}

resource "talos_machine_configuration_apply" "node" {
  count                       = var.talos_node.nodes
  client_configuration        = talos_machine_secrets.talos.client_configuration
  machine_configuration_input = data.talos_machine_configuration.node[count.index].machine_configuration
  node                        = cidrhost(var.talos_node.subnet, count.index + 3)
}

