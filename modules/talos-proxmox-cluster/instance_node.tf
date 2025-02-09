resource "proxmox_virtual_environment_vm" "talos-vm-node" {
  count       = var.talos_node.nodes
  name        = "${var.cluster_name}-node-${count.index}"
  description = "Managed by OpenTofu"
  tags        = ["talos", "node", var.cluster_name]

  bios = "ovmf"

  efi_disk {
    datastore_id = var.proxmox.node_datastore
    file_format  = "raw"
    type         = "4m"
  }

  node_name = var.proxmox.machines[(count.index + 1) % length(var.proxmox.machines)]
  vm_id     = var.talos_node.first_id + count.index

  machine = "q35"

  memory {
    dedicated = var.talos_node.memory # set equal to dedicated to enable ballooning
  }

  boot_order = ["scsi0", "ide0"]
  cpu {
    cores = var.talos_node.cores
    type  = "host"
  }

  disk {
    interface    = "scsi0"
    datastore_id = var.proxmox.node_datastore
    file_format  = "raw"
    size         = 40
  }

  dynamic "disk" {
    for_each = var.rook.nodes_enabled ? [1] : []
    content {
      interface    = "scsi1"
      datastore_id = var.proxmox.control_plane_datastore
      file_format  = "raw"
      size         = var.rook.nodes_size
    }
  }

  cdrom {
    enabled   = true
    file_id   = "local:iso/talos-1-9.iso"
    interface = "ide0"
  }

  initialization {
    dns {
      servers = var.network_config.dns_servers
      domain  = var.network_config.domain
    }
    ip_config {
      ipv4 {
        address = "${cidrhost(local.node_network, count.index + 3)}/${var.talos_network.subnet_cidr}"
        gateway = var.network_config.gateway
      }
    }
  }


  network_device {
    bridge  = var.network_bridges.default
    vlan_id = var.network_bridges.default_vlan
  }

  network_device {
    bridge = var.network_bridges.storage
  }

  operating_system {
    type = "l26"
  }

  tpm_state {
    version = "v2.0"
  }

  serial_device {}
}