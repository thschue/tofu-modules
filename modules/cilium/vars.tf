variable "namespace" {
  description = "Namespace to deploy the Cilium Helm chart"
  type        = string
  default     = "kube-system"
}

variable "enable_ingress_controller" {
  description = "Enable the Cilium ingress controller"
  type        = bool
  default     = false
}

variable "lb_config" {
  description = "IP pool for the Cilium load balancer"
  type = object({
    enabled = optional(bool, false)
    cidr    = optional(string, "")
  })
}