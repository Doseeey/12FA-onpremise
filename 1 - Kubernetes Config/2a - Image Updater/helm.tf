resource "helm_release" "argocd_image_updater" {
  name       = "argocd-image-updater"
  namespace  = var.argocd_namespace
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-image-updater"
  version    = "0.12.0"

  set {
    name  = "argocd.server"
    value = "argocd-server.argocd.svc"
  }
}
