variable "cluster_name" {
  description = "The name of the cluster"
  type        = string
}

variable "node_network" {
  description = "The network configuration for the nodes"
  type = object({
    subnet = string
    vlan   = number
  })
}

variable "load_balancer_network" {
  description = "The network configuration for the services"
  type = object({
    subnet = string
    vlan   = number
  })
}
