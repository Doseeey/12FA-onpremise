resource "kubernetes_config_map" "pgadmin_servers" {
  metadata {
    name      = "pgadmin-servers"
    namespace = var.pg_namespace
  }
  data = {
    "servers.json" = <<EOT
{
  "Servers": {
    "1": {
      "Name": "PostgreSQL Local",
      "Group": "Servers",
      "Host": "postgres.postgres.svc.cluster.local",
      "Port": 5432,
      "MaintenanceDB": "postgres",
      "Username": "pgadmin",
      "SSLMode": "prefer"
    }
  }
}
EOT
  }
}