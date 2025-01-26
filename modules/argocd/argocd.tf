resource "helm_release" "argocd" {
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  name             = "argo-cd"
  version          = "7.7.17"
  namespace        = "argocd-system"
  wait             = true
  create_namespace = true
}