resource "unifi_network" "k8s_nodes" {
  name         = "k8s-${var.cluster_name}-nodes"
  vlan_id      = var.node_network.vlan
  subnet       = var.node_network.subnet
  purpose      = "corporate"
  dhcp_enabled = false
}

resource "unifi_network" "k8s_services" {
  name         = "k8s-${var.cluster_name}-services"
  vlan_id      = var.load_balancer_network.vlan
  subnet       = var.load_balancer_network.subnet
  purpose      = "corporate"
  dhcp_enabled = false
}
