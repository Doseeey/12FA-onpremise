module "cert-manager" {
  source             = "./0 - Cert Manager"
  kubeconfig_context = var.kube-context
  issuer_email       = var.issuer_email
}

module "ingress-nginx" {
  source = "./1 - Ingress Nginx"
}

module "argocd" {
  source             = "./2 - ArgoCD"
  root-domain        = var.root-domain
  kubeconfig_context = var.kube-context
  depends_on         = [module.ingress-nginx]
}

module "postgres" {
  source             = "./3 - Postgres Database"
  root-domain        = var.root-domain
  kubeconfig_context = var.kube-context
  database_username  = var.database_username
  database_password  = var.database_password
}

module "pgadmin" {
  source             = "./4 - pgAdmin"
  root-domain        = var.root-domain
  kubeconfig_context = var.kube-context
  pg_namespace       = module.postgres.postgres_namespace
  pg_username        = var.pg_username
  pg_password        = var.pg_password
  depends_on         = [module.ingress-nginx, module.postgres]
}

module "container-registry" {
  source = "./5 - Container Registry"
  repositories = var.repositories
  docker_username = var.docker_username
}