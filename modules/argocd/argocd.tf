resource "helm_release" "argocd" {
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  name             = "argo-cd"
  version          = "8.5.3"
  namespace        = var.argo_namespace
  wait             = true
  create_namespace = true
}

resource "helm_release" "argocd_app" {
  name       = "argo-configuration"
  chart      = "argocd-apps"
  version    = "2.0.2"
  atomic     = true
  wait       = true
  repository = "https://argoproj.github.io/argo-helm"

  values = [
    templatefile("${path.module}/templates/argocd_app.yaml.tpl", {
      namespace    = var.argo_namespace,
      applications = var.apps
      projects     = var.projects
    })
  ]

  depends_on = [
    helm_release.argocd
  ]
}

resource "kubernetes_secret" "github_tokens" {
  count = var.repo_secret != null ? 1 : 0
  metadata {
    labels = {
      "argocd.argoproj.io/secret-type" = "repository",
    }
    namespace = helm_release.argocd.namespace
    name      = "argo-github-token-${var.repo_secret.name}"
  }
  data = {
    "username" = var.repo_secret.username
    "password" = var.repo_secret.token
    "type"     = "git"
    "url"      = var.repo_secret.repo
  }

  depends_on = [
    helm_release.argocd
  ]
}

resource "kubernetes_secret" "github_deploy_keys" {
  count = var.deploy_key != null ? 1 : 0
  metadata {
    labels = {
      "argocd.argoproj.io/secret-type" = "repository",
    }
    namespace = helm_release.argocd.namespace
    name      = "argo-github-key-${var.deploy_key.name}"
  }
  data = {
    "type"          = "git"
    "url"           = var.deploy_key.repo
    "sshPrivateKey" = var.deploy_key.key
  }

  depends_on = [
    helm_release.argocd
  ]
}

resource "kubernetes_secret" "github_app" {
  count = var.github_app != null ? 1 : 0
  metadata {
    labels = {
      "argocd.argoproj.io/secret-type" = "repository",
    }
    namespace = helm_release.argocd.namespace
    name      = "argo-github-app-${var.github_app.name}"
  }
  data = {
    "githubAppID"             = var.github_app.app_id
    "githubAppInstallationID" = var.github_app.installation_id
    "githubAppPrivateKey"     = var.github_app.private_key
    "url"                     = var.github_app.repo
  }

  depends_on = [
    helm_release.argocd
  ]
}