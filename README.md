# OpenTofu Modules

This repository contains a collection of modules for [OpenTofu](https://opentofu.org) that can be used to deploy various infrastructure components, mainly to build a HomeLab or demo environments.

## Modules
* **[talos-proxmox-cluster](./modules/talos-proxmox-cluster/README.md)**: Module to build a talos cluster on top of proxmox
* **[cilium](./modules/cilium/README.md)**: Module to deploy cilium (in this case on a talos cluster)
* **[argocd](./modules/argocd/README.md)**: Module to deploy argocd (in this case on a talos cluster), work in progress

## Examples
* **[talos-cluster](./examples/talos-cluster/README.md)**: Example of how to use the talos-proxmox-cluster module
