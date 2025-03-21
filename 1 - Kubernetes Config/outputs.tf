output "argocd_admin_username" {
  value = module.argocd.argocd_admin_username
}

output "argocd_admin_password" {
  value     = module.argocd.argocd_admin_password
  sensitive = true
}