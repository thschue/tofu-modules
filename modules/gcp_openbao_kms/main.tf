resource "google_kms_key_ring" "openbao_ring" {
  name     = "openbao-${var.openbao_name}-keyring"
  location = var.location
}

resource "google_kms_crypto_key" "openbao_key" {
  name            = "openbao-${var.openbao_name}-key"
  key_ring        = google_kms_key_ring.openbao_ring.id
  rotation_period = "2592000s" # 30 days

  # Use asymmetric or symmetric based on OpenBao needs
  purpose = "ENCRYPT_DECRYPT"

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_service_account" "openbao_sa" {
  account_id   = "openbao-${var.openbao_name}-sa"
  display_name = "OpenBao Service Account"
}

resource "google_kms_crypto_key_iam_binding" "openbao_kms_permissions" {
  crypto_key_id = google_kms_crypto_key.openbao_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = [
    "serviceAccount:${google_service_account.openbao_sa.email}",
  ]
}

resource "google_service_account_key" "service_account_key" {
  service_account_id = google_service_account.openbao_sa.name
}