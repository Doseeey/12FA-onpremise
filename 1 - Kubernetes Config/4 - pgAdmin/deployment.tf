resource "kubernetes_deployment" "pgadmin" {
  metadata {
    name      = "pgadmin"
    namespace = var.pg_namespace
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "pgadmin"
      }
    }
    template {
      metadata {
        labels = {
          app = "pgadmin"
        }
      }
      spec {
        container {
          name  = "pgadmin"
          image = "dpage/pgadmin4:7"
          env {
            name  = "PGADMIN_DEFAULT_EMAIL"
            value = var.pg_username
          }
          env {
            name  = "PGADMIN_DEFAULT_PASSWORD"
            value = var.pg_password
          }
          port {
            container_port = 80
          }
          volume_mount {
            name       = "pgadmin-servers"
            mount_path = "/pgadmin4/servers.json"
            sub_path   = "servers.json"
          }
        }
        volume {
          name = "pgadmin-servers"
          config_map {
            name = kubernetes_config_map.pgadmin_servers.metadata.0.name
          }
        }
      }
    }
  }
}