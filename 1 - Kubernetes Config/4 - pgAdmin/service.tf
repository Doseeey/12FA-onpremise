resource "kubernetes_service" "pgadmin" {
  metadata {
    name      = "pgadmin"
    namespace = var.pg_namespace
  }
  spec {
    selector = {
      app = "pgadmin"
    }
    port {
      port        = 80
      target_port = 80
      node_port   = 30001
    }
    type = "NodePort"
  }
}