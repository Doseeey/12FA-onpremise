output "postgres_namespace" {
  value = kubernetes_namespace.postgres.metadata.0.name
}