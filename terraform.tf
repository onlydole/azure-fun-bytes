terraform {
  # see https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
  required_version = "0.14.5"

  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/azurerm/2.44.0
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.44.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/helm/2.0.2
    helm = {
      source  = "hashicorp/helm"
      version = "2.0.2"
    }

    # see https://registry.terraform.io/providers/hashicorp/kubernetes/2.0.1
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.0.1"
    }

    # see https://registry.terraform.io/providers/hashicorp/local/2.0.0
    local = {
      source  = "hashicorp/local"
      version = "2.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/null/3.0.0
    null = {
      source  = "hashicorp/null"
      version = "3.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/random/3.0.1
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }

    # see https://registry.terraform.io/providers/hashicorp/template/2.2.0
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }

  # see https://www.terraform.io/docs/language/settings/backends/remote.html
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "onlydole"

    # see https://www.terraform.io/docs/language/settings/backends/remote.html#workspaces
    workspaces {
      name = "azure-fun-bytes"
    }
  }
}
