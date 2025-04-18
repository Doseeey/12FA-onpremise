resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = kubernetes_namespace.ingress-namespace.metadata[0].name
  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }
}