resource "kubectl_manifest" "cluster_issuer" {
  yaml_body = templatefile("${path.module}/cluster-issuer.yaml", {
    issuer_email = var.issuer_email
  })
}