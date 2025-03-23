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

module "argocd-image-updater" {
  source             = "./2a - Image Updater"
  kubeconfig_context = var.kube-context
  argocd_namespace   = module.argocd.argocd_namespace
}

module "argocd-application" {
  source             = "./2b - ArgoCD Application"
  kubeconfig_context = var.kube-context
  argocd_namespace   = module.argocd.argocd_namespace
  frontend_image     = var.frontend_image
  backend_image      = var.backend_image
  environment_values = var.environment_values
  chart_path         = var.chart_path
  chart_repository   = var.chart_repository
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
  source          = "./5 - Container Registry"
  repositories    = var.repositories
  docker_username = var.docker_username
}