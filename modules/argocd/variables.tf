variable "argo_namespace" {
  type    = string
  default = "argocd"
}

variable "repo_secret" {
  sensitive = true
  type = object({
    name     = string
    repo     = string
    username = string
    token    = string
  })
  default = []
}

variable "deploy_key" {
  sensitive = true
  type = object({
    name = string
    repo = string
    key  = string
  })
  default = []
}

variable "projects" {
  type = list(string)
  default = []
}

variable "apps" {
  type = list(object({
    name = string
    repo = string
    path = optional(string, "/")
    revision = optional(string, "HEAD")
    project = optional(string, "default")
  }))
  default = []
}