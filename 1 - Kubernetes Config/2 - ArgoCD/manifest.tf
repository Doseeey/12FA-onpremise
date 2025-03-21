data "http" "argocd_manifest" {
  url = "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml"
}

resource "kubectl_manifest" "argocd_manifest" {
  yaml_body          = data.http.argocd_manifest.response_body
  override_namespace = kubernetes_namespace.argocd-namespace.metadata.0.name
}

data "kubernetes_secret" "argocd_initial_admin_password" {
  metadata {
    name      = "argocd-initial-admin-secret"
    namespace = kubernetes_namespace.argocd-namespace.metadata.0.name
  }
}