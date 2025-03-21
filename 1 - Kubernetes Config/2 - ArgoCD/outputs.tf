output "argocd_admin_username" {
  value = "admin"
}

output "argocd_admin_password" {
  value = data.kubernetes_secret.argocd_initial_admin_password.data.password
}

output "debug_manifest" {
  value = data.http.argocd_manifest.response_body
}