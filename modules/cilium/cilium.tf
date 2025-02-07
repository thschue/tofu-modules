resource "helm_release" "cilium" {
  repository = "https://helm.cilium.io/"
  chart      = "cilium"
  name       = "cilium"
  version    = "1.17.0"
  namespace  = var.namespace
  wait       = true
  set {
    name  = "ipam.mode"
    value = "kubernetes"
  }
  set {
    name  = "kubeProxyReplacement"
    value = "true"
  }
  set {
    name  = "securityContext.capabilities.ciliumAgent"
    value = "{CHOWN,KILL,NET_ADMIN,NET_RAW,IPC_LOCK,SYS_ADMIN,SYS_RESOURCE,DAC_OVERRIDE,FOWNER,SETGID,SETUID}"
  }
  set {
    name  = "securityContext.capabilities.cleanCiliumState"
    value = "{NET_ADMIN,SYS_ADMIN,SYS_RESOURCE}"
  }
  set {
    name  = "cgroup.autoMount.enabled"
    value = "false"
  }
  set {
    name  = "cgroup.hostRoot"
    value = "/sys/fs/cgroup"
  }
  set {
    name  = "k8sServiceHost"
    value = "localhost"
  }
  set {
    name  = "k8sServicePort"
    value = "7445"
  }
  set {
    name  = "l2announcements.enabled"
    value = tostring(var.enable_l2announcements)
  }
  set {
    name  = "ingressController.enabled"
    value = tostring(var.enable_ingress_controller)
  }
  set {
    name  = "ingressController.default"
    value = tostring(var.enable_ingress_controller)
  }
}