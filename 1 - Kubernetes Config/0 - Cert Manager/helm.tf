resource "helm_release" "cert-manager" {
  name       = "cert-manager"
  namespace  = kubernetes_namespace.cert-manager-namespace.metadata.0.name
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"

  set {
    name  = "installCRDs"
    value = true
  }

  wait = true

  depends_on = [kubernetes_namespace.cert-manager-namespace]
}
