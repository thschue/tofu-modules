terraform {
  required_version = ">= 1.6.0"
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.70.0"
    }
    talos = {
      source  = "siderolabs/talos"
      version = "0.7.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.17.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.3"
    }
  }
}

provider "proxmox" {
  endpoint = "https://my-proxmox-hostname:8006/"

  # TODO: use terraform variable or remove the line, and use PROXMOX_VE_USERNAME environment variable
  username = "root@pam"

  # because self-signed TLS certificate is in use
  insecure = true
  # uncomment (unless on Windows...)
  # tmp_dir  = "/var/tmp"

  ssh {
    agent = true
    # TODO: uncomment and configure if using api_token instead of password
    # username = "root"
  }
}


provider "helm" {
  kubernetes {
    client_certificate     = module.cluster-1.kubeconfig.client_certificate
    client_key             = module.cluster-1.kubeconfig.client_key
    cluster_ca_certificate = module.cluster-1.kubeconfig.cluster_ca_certificate
    host                   = module.cluster-1.kubeconfig.host
  }
}