resource "kubectl_manifest" "argocd_application" {
  yaml_body = templatefile("${path.module}/application.yaml", {
    argocd_namespace   = var.argocd_namespace
    backend_image      = var.backend_image
    frontend_image     = var.frontend_image
    environment_values = var.environment_values
    chart_path         = var.chart_path
    chart_repository   = var.chart_repository
  })
}