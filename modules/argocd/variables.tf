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
  default = null
}

variable "deploy_key" {
  sensitive = true
  type = object({
    name = string
    repo = string
    key  = string
  })
  default = null
}

variable "github_app" {
  sensitive = true
  type = object({
    name            = string
    repo            = string
    installation_id = string
    private_key     = string
    app_id          = string
  })
  default = null
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