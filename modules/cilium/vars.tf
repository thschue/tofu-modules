variable "namespace" {
  description = "Namespace to deploy the Cilium Helm chart"
  type        = string
  default     = "kube-system"
}

variable "enable_l2announcements" {
  description = "Enable L2 announcements"
  type        = bool
  default     = false
}

variable "enable_ingress_controller" {
  description = "Enable the Cilium ingress controller"
  type        = bool
  default     = false
}