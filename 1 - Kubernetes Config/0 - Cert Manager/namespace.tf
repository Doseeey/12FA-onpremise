resource "kubernetes_namespace" "cert-manager-namespace" {
  metadata {
    name = "cert-manager"
  }
}