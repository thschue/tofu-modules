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

resource "kubernetes_secret" "github_keys" {
  for_each = {
    for secret in var.repo_secrets : secret.name => secret
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
  }

  depends_on = [
    helm_release.argocd
  ]
}

resource "kubernetes_secret" "github_keys" {
  for_each = {
    for secret in var.repo_secrets : secret.name => secret
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
  }

  depends_on = [
    helm_release.argocd
  ]
}

resource "kubernetes_secret" "github_deploy_keys" {
  for_each = {
    for secret in var.deploy_keys : secret.name => secret
  }
  metadata {
    labels = {
      "argocd.argoproj.io/secret-type" = "repository",
    }
    namespace = helm_release.argocd.namespace
    name      = "argo-github-deploy-key-${each.value.name}"
  }
  data = {
    "type"          = "git"
    "url"           = each.value.repo
    "sshPrivateKey" = each.value.key
  }

  depends_on = [
    helm_release.argocd
  ]
}