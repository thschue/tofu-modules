variable "openbao_name" {
  description = "The name of the OpenBao instance"
  type        = string
}

variable "location" {
  description = "The location of the KMS"
  type        = string
  default     = "europe-west1"
}

variable "project" {
  type        = string
  description = "The project where the KMS runs"
}

variable "key_admins" {
  description = "The list of users who can manage the key"
  type        = list(string)
}