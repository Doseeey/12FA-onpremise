resource "kubernetes_namespace" "argocd-namespace" {
  metadata {
    name = "argocd"
  }
}