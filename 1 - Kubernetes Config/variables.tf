variable "kube-context" {
  type    = string
  default = "docker-desktop"
}

variable "root-domain" {
  type    = string
  default = "localhost"
}

variable "database_username" {
  type    = string
  default = "pgadmin"
}

variable "database_password" {
  type    = string
  default = ""
}

variable "pg_username" {
  type    = string
  default = "admin@admin.org"
}

variable "pg_password" {
  type    = string
  default = "admin"
}

variable "issuer_email" {
  type    = string
  default = "test@admin.com"
}

variable "docker_username" {
  type    = string
  default = ""
}

variable "docker_password" {
  type    = string
  default = ""
}

variable "repositories" {
  type    = list(string)
  default = ["backend", "frontend"]
}

variable "frontend_image" {
  type    = string
  default = ""
}

variable "backend_image" {
  type    = string
  default = ""
}

variable "environment_values" {
  type    = string
  default = "../../3 - Environment Setup/values.dev.yaml"
}

variable "chart_path" {
  type    = string
  default = "2 - Application Config/terminal"
}

variable "chart_repository" {
  type    = string
  default = "https://gitlab.com/projects_jakub/iaac.git"
}
