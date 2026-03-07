terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.98.0"
    }
    talos = {
      source  = "siderolabs/talos"
      version = "0.10.1"
    }
  }
}