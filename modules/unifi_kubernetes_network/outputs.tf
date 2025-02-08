output "node_network" {
  value = {
    node_subnet = unifi_network.k8s_nodes.subnet
    node_vlan   = unifi_network.k8s_nodes.vlan_id
    dns_servers = unifi_network.k8s_nodes.dhcp_dns
  }
}

output "load_balancer_network" {
  value = {
    node_subnet = unifi_network.k8s_services.subnet
    node_vlan   = unifi_network.k8s_services.vlan_id
  }
}