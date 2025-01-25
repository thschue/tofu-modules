variable "namespace" {
  description = "Namespace to deploy the Cilium Helm chart"
  type        = string
  default     = "kube-system"
}