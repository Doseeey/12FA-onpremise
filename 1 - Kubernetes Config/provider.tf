terraform {
  required_version = ">= 1.10.0"

  required_providers {
    kubernetes = {
      source  = "kubernetes"
      version = "~> 2.35"
    }
    helm = {
      source  = "helm"
      version = "~> 2.17"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.3"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.18.0"
    }
    dockerhub = {
      source  = "BarnabyShearer/dockerhub"
      version = ">= 0.0.15"
    }
  }

}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = var.kube-context
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = var.kube-context
  }
}

provider "kubectl" {
  config_context = var.kube-context
  config_path    = "~/.kube/config"
}

provider "dockerhub" {
  username = var.docker_username
  password = var.docker_password
}