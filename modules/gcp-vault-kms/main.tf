resource "google_kms_key_ring" "vault_ring" {
  name     = "vault-${var.vault_name}-keyring"
  location = var.location
  project  = var.project
}

resource "google_kms_crypto_key" "vault_key" {
  # checkov:skip=CKV_GCP_82: 'lifecycle' is used to prevent accidental deletion of the key
  name            = "vault-${var.vault_name}-key"
  key_ring        = google_kms_key_ring.vault_ring.id
  rotation_period = "2592000s" # 30 days


  # Use asymmetric or symmetric based on OpenBao needs
  purpose = "ENCRYPT_DECRYPT"

}

resource "google_service_account" "vault_sa" {
  account_id   = "vault-${var.vault_name}-sa"
  display_name = "Vault Service Account"
  project      = var.project
}

resource "google_kms_crypto_key_iam_binding" "vault_kms_permissions" {
  crypto_key_id = google_kms_crypto_key.vault_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = [
    "serviceAccount:${google_service_account.vault_sa.email}",
  ]
}

resource "google_kms_crypto_key_iam_binding" "vault_kms_viewer" {
  crypto_key_id = google_kms_crypto_key.vault_key.id
  role          = "roles/cloudkms.viewer"

  members = [
    "serviceAccount:${google_service_account.vault_sa.email}",
  ]
}

resource "google_kms_crypto_key_iam_binding" "vault_kms_admins" {
  for_each      = toset(var.key_admins)
  crypto_key_id = google_kms_crypto_key.vault_key.id
  role          = "roles/cloudkms.admin"

  members = [
    "serviceAccount:${each.value}",
  ]
}



resource "google_service_account_key" "service_account_key" {
  service_account_id = google_service_account.vault_sa.name
}