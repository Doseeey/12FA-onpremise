resource "kubernetes_namespace" "ingress-namespace" {
  metadata {
    name = "ingress-nginx"
  }
}