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
    username = optional(string, "")
    token    = optional(string, "")
    project  = optional(string, "default")
  }))
  default = []
}