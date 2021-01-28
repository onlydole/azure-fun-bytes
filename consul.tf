provider "helm" {
  kubernetes {
    host                   = module.aks.host
    client_certificate     = base64decode(module.aks.client_certificate)
    client_key             = base64decode(module.aks.client_key)
    cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
  }
}

resource "helm_release" "consul" {
  name       = "hashicorp"
  chart      = "consul"
  repository = "https://helm.releases.hashicorp.com"
  version    = "0.28.0"

  values = [
    file("consul.yaml")
  ]

  set {
    name  = "global.datacenter"
    value = var.project_name
  }
  depends_on = [kubernetes_secret.consul_gossip_encryption_key]
}
