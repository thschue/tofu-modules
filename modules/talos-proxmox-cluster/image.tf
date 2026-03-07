resource "proxmox_virtual_environment_download_file" "talos_nocloud_image" {
  for_each                = toset(var.proxmox.machines)
  content_type            = "import-iso"
  datastore_id            = "local"
  node_name               = each.value
  url                     = "https://factory.talos.dev/image/a61fb6545e845df20138f245e78c1ff958a516e729f85d17f181de4711b5063d/v${var.talos_control_plane.version}/nocloud-amd64.raw.xz"
  file_name               = "talos-v${var.talos_control_plane.version}-nocloud-amd64.img"
  decompression_algorithm = "xz"
  overwrite               = false
}

