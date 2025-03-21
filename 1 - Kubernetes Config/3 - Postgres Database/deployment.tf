resource "kubernetes_deployment" "postgres" {
  metadata {
    name      = "postgres"
    namespace = kubernetes_namespace.postgres.metadata.0.name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "postgres"
      }
    }
    template {
      metadata {
        labels = {
          app = "postgres"
        }
      }
      spec {
        container {
          name  = "postgres"
          image = "postgres:15"
          env {
            name  = "POSTGRES_USER"
            value = var.database_username
          }
          env {
            name  = "POSTGRES_PASSWORD"
            value = var.database_password
          }
          volume_mount {
            name       = "postgres-data"
            mount_path = "/var/lib/postgresql/data"
          }
          port {
            container_port = 5432
          }
        }
        volume {
          name = "postgres-data"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.postgres_pvc.metadata[0].name
          }
        }
      }
    }
  }
}