variable "kubeconfig_context" {
  type = string
}

variable "argocd_namespace" {
  type = string
}

variable "backend_image" {
  type = string
}

variable "frontend_image" {
  type = string
}

variable "environment_values" {
  type = string
}

variable "chart_path" {
  type = string
}

variable "chart_repository" {
  type = string
}