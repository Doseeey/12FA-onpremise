variable "kube-context" {
  type    = string
  default = "docker-desktop"
}

variable "root-domain" {
  type    = string
  default = ""
}

variable "database_username" {
  type    = string
  default = "pgadmin"
}

variable "database_password" {
  type    = string
  default = "pgadmin"
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
  type = string
  default = ""
}

variable "docker_password" {
  type = string
  default = ""
}

variable "repositories" {
  type = list(string)
  default = ["backend", "frontend"]
}