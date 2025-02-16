output "service_account_key" {
  value     = google_service_account_key.service_account_key.private_key
  sensitive = true
}

output "key_ring" {
  value     = google_kms_key_ring.vault_ring.name
  sensitive = true
}

output "crypto_key" {
  value     = google_kms_crypto_key.vault_key.name
  sensitive = true
}