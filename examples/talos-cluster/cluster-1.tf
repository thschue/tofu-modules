
module "cluster-1" {
  #checkov:skip=CKV_TF_1
  source       = "github.com/thschue/tofu-modules//modules/talos-proxmox-cluster?ref=v0.0.3"
  cluster_name = "core-cluster"
  proxmox = {
    control_plane_datastore = "local-lvm"
    node_datastore          = "local-lvm"
    machines = [
      "node-01",
      "node-02",
      "node-03",
    ]
  }
  // subnet defines the network for "normal" traffic, cluster_subnet is used for the storage network
  talos_control_plane = {
    version        = "1.9.1"
    nodes          = 3
    subnet         = "10.0.58.48/29"
    cluster_subnet = "10.0.254.48/29"
    first_id       = 2000
  }

  talos_node = {
    version        = "1.9.1"
    nodes          = 3
    subnet         = "10.0.58.56/29"
    cluster_subnet = "10.0.254.56/29"
    first_id       = 2010
  }
  network_config = {
    gateway     = "10.0.58.1"
    dns_servers = ["10.0.99.1"]
    domain      = "examples.on-clouds.at"
  }
}

resource "null_resource" "wait_for_cluster" {
  depends_on = [
    module.cluster-1.kubeconfig
  ]

  provisioner "local-exec" {
    command     = var.wait_for_cluster_cmd
    interpreter = var.wait_for_cluster_interpreter
    environment = {
      ENDPOINT = module.cluster-1.kubeconfig.host
    }
  }
}


module "cilium" {
  #checkov:skip=CKV_TF_1
  source = "github.com/thschue/tofu-modules//modules/cilium?ref=v0.0.3"

  depends_on = [
    null_resource.wait_for_cluster,
    module.cluster-1
  ]
}

output "kubeconfig" {
  value     = module.cluster-1.kubeconfig_file
  sensitive = true
}

output "endpoint" {
  value = module.cluster-1.kubeconfig.host
}