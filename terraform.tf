terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 2.1"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.44"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 2.3"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 1.4"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "onlydole"

    workspaces {
      name = "azure-fun-bytes"
    }
  }
}

