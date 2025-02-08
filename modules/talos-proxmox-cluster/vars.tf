variable "network_bridges" {
  type = object({
    default      = string
    default_vlan = optional(number, 0)
    storage      = string
  })
}

variable "cluster_name" {
  type    = string
  default = "dev-cluster"
}

variable "proxmox" {
  type = object({
    control_plane_datastore = optional(string, "local-lvm")
    node_datastore          = optional(string, "local-lvm")
    machines                = list(string)
  })
}

variable "talos_network" {
  type = object({
    subnet = string
  })
}

variable "talos_control_plane" {
  type = object({
    static_networking   = optional(bool, false)
    version             = optional(string, "1.9.1")
    nodes               = optional(number, 3)
    cluster_subnet      = string
    cluster_subnet_cidr = optional(number, 24)
    first_id            = number
  })
}

variable "talos_node" {
  type = object({
    static_networking   = optional(bool, false)
    version             = optional(string, "1.9.1")
    nodes               = optional(number, 3)
    cluster_subnet      = string
    cluster_subnet_cidr = optional(number, 24)
    first_id            = number
  })
}

variable "network_config" {
  type = object({
    dns_servers = list(string)
    domain      = string
    gateway     = string
  })
}