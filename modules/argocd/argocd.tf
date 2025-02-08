resource "helm_release" "argocd" {
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  name             = "argo-cd"
  version          = "7.8.2"
  namespace        = var.argo_namespace
  wait             = true
  create_namespace = true
}

resource "helm_release" "argocd_app" {
  for_each = {
    for app in var.apps : app.name => app
  }
  name       = "argo-app-${each.value.name}"
  chart      = "argocd-apps"
  version    = "2.0.2"
  atomic     = true
  wait       = true
  repository = "https://argoproj.github.io/argo-helm"

  values = [
    templatefile("${path.module}/templates/argocd_app.yaml.tpl", {
      namespace         = var.argo_namespace,
      git_repo_url      = each.value.repo,
      git_repo_path     = each.value.path
      git_repo_revision = each.value.revision
      project           = each.value.project
    })
  ]

  depends_on = [
    helm_release.argocd
  ]
}

resource "kubernetes_secret" "github_keys" {
  for_each = {
    for app in var.apps : app.name => app
  }
  metadata {
    labels = {
      "argocd.argoproj.io/secret-type" = "repository",
    }
    namespace = helm_release.argocd.namespace
    name      = "argo-github-key-${each.value.name}"
  }
  data = {
    "username" = each.value.username
    "password" = each.value.token
    "type"     = "git"
    "url"      = each.value.repo
    "name"     = "github-${each.value.name}"
  }

  depends_on = [
    helm_release.argocd
  ]
}