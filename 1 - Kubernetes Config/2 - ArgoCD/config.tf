resource "kubernetes_config_map" "argocd_cmd_params" {
  metadata {
    name      = "argocd-cmd-params-cm"
    namespace = kubernetes_namespace.argocd-namespace.metadata.0.name
  }
  data = {
    "server.insecure" = "true"
  }
}