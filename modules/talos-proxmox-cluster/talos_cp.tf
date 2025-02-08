locals {
  vip_ip       = cidrhost(var.talos_network.subnet, 2)
  cp_network   = cidrsubnet(var.talos_network.subnet, 1, 0)
  node_network = cidrsubnet(var.talos_network.subnet, 1, 1)
}

data "talos_machine_configuration" "controller" {
  count            = var.talos_control_plane.nodes
  cluster_name     = var.cluster_name
  cluster_endpoint = "https://${local.vip_ip}:6443"
  machine_secrets  = talos_machine_secrets.talos.machine_secrets
  machine_type     = "controlplane"
  talos_version    = "v${var.talos_control_plane.version}"
  config_patches = [
    yamlencode({
      cluster = {
        proxy = {
          disabled = true
        }
        network = {
          cni = {
            name = "none"
          }
        }
      }
      machine = {
        kubelet = {
          nodeIP = {
            validSubnets = [
              "${var.talos_control_plane.cluster_subnet}/${var.talos_control_plane.cluster_subnet_cidr}"
            ]
          }

        },
        network = {
          interfaces = [
            # see https://www.talos.dev/v1.8/talos-guides/network/vip/
            {
              interface = "eth0"
              vip = {
                ip = local.vip_ip
              }
            },
            {
              interface = "eth1"
              addresses = ["${cidrhost(var.talos_control_plane.cluster_subnet, count.index + 3)}/${var.talos_control_plane.cluster_subnet_cidr}"]
            }
          ]
        }
      }
    }),
  ]
}

resource "talos_machine_configuration_apply" "control_plane" {
  count                       = var.talos_control_plane.nodes
  client_configuration        = talos_machine_secrets.talos.client_configuration
  machine_configuration_input = data.talos_machine_configuration.controller[count.index].machine_configuration
  node                        = cidrhost(local.cp_network, count.index + 3)
}

resource "talos_machine_bootstrap" "control_plane" {
  depends_on = [
    talos_machine_configuration_apply.control_plane
  ]
  node                 = cidrhost(local.cp_network, 3)
  client_configuration = talos_machine_secrets.talos.client_configuration
}

resource "talos_cluster_kubeconfig" "this" {
  depends_on = [
    talos_machine_bootstrap.control_plane
  ]
  client_configuration = talos_machine_secrets.talos.client_configuration
  node                 = local.vip_ip
}
