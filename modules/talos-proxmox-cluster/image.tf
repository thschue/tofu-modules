resource "proxmox_virtual_environment_download_file" "talos_nocloud_image" {
  for_each     = toset(var.proxmox.machines)
  content_type = "iso"
  datastore_id = "local"
  node_name    = each.value
  url          = "https://factory.talos.dev/image/3a7e59d4cf1764eff20f8c2a205e19d6398ff0223e4955743957898a03da713c/v${var.talos_control_plane.version}/nocloud-amd64.raw.xz"
  file_name    = "talos-v${var.talos_control_plane.version}-nocloud-amd64.img"
}

