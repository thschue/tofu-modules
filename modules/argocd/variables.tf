variable "argo_namespace" {
  type    = string
  default = "argocd"
}

variable "apps" {
  type = list(object({
    name     = string
    repo     = string
    path     = optional(string, "/")
    revision = optional(string, "HEAD")
    key      = string
  }))
  default = []
}