resource "kubernetes_ingress_v1" "argocd" {
  metadata {
    name      = "argocd-ingress"
    namespace = kubernetes_namespace.argocd-namespace.metadata[0].name
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
      "cert-manager.io/cluster-issuer" : "letsencrypt-test"
      "nginx.ingress.kubernetes.io/force-ssl-redirect" : "true"
      "nginx.ingress.kubernetes.io/backend-protocol" : "HTTP"
    }
  }

  spec {
    tls {
      hosts       = ["argocd.${var.root-domain}"]
      secret_name = "argocd-tls"
    }

    rule {
      host = "argocd.${var.root-domain}"
      http {
        path {
          path = "/"
          backend {
            service {
              name = "argocd-server"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}