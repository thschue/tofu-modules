resource "proxmox_virtual_environment_vm" "talos-vm-cp" {
  count       = var.talos_control_plane.nodes
  name        = "${var.cluster_name}-control-plane-${count.index}"
  description = "Managed by OpenTofu"
  tags        = ["talos", "control-plane", var.cluster_name]

  bios = "ovmf"

  efi_disk {
    datastore_id = var.proxmox.control_plane_datastore
    file_format  = "raw"
    type         = "4m"
  }

  node_name = var.proxmox.machines[count.index % length(var.proxmox.machines)]
  vm_id     = var.talos_control_plane.first_id + count.index

  machine = "q35"

  memory {
    dedicated = var.talos_control_plane.memory # set equal to dedicated to enable ballooning
  }

  boot_order = ["scsi0", "ide0"]
  cpu {
    cores = var.talos_control_plane.cores
    type  = "host"
  }

  disk {
    interface    = "scsi0"
    datastore_id = var.proxmox.control_plane_datastore
    file_format  = "raw"
    size         = 40
  }

  dynamic "disk" {
    for_each = var.rook.control_plane_enabled ? [1] : []
    content {
      interface    = "scsi1"
      datastore_id = var.proxmox.control_plane_datastore
      file_format  = "raw"
      size         = var.rook.control_plane_size
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
        address = "${cidrhost(local.cp_network, count.index + 3)}/${var.talos_network.subnet_cidr}"
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


locals {
  kubeconfig_data = {
    host                   = talos_cluster_kubeconfig.this.kubernetes_client_configuration.host
    cluster_ca_certificate = base64decode(talos_cluster_kubeconfig.this.kubernetes_client_configuration.ca_certificate)
    client_certificate     = base64decode(talos_cluster_kubeconfig.this.kubernetes_client_configuration.client_certificate)
    client_key             = base64decode(talos_cluster_kubeconfig.this.kubernetes_client_configuration.client_key)
  }
}

output "kubeconfig" {
  value = local.kubeconfig_data
}

output "kubeconfig_file" {
  value = talos_cluster_kubeconfig.this.kubeconfig_raw
}


