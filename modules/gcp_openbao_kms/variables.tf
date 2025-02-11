variable "openbao_name" {
  description = "The name of the OpenBao instance"
  type        = string
}

variable "location" {
  description = "The location of the KMS"
  type        = string
  default     = "europe-west1"
}