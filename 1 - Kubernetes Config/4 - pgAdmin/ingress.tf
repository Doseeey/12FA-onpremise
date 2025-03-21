resource "kubernetes_ingress_v1" "pgadmin" {
  metadata {
    name      = "pgadmin-ingress"
    namespace = var.pg_namespace
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
      "cert-manager.io/cluster-issuer" : "letsencrypt-test"
      "nginx.ingress.kubernetes.io/force-ssl-redirect" : "true"
      "nginx.ingress.kubernetes.io/backend-protocol" : "HTTP"
    }
  }

  spec {
    tls {
      hosts       = ["pgadmin.${var.root-domain}"]
      secret_name = "pgadmin-tls"
    }

    rule {
      host = "pgadmin.${var.root-domain}"
      http {
        path {
          path = "/"
          backend {
            service {
              name = "pgadmin"
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