provider "kubernetes" {
  host                   = module.aks.host
  client_certificate     = base64decode(module.aks.client_certificate)
  client_key             = base64decode(module.aks.client_key)
  cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
}

resource "kubernetes_secret" "consul_gossip_encryption_key" {
  metadata {
    name = "consul-gossip-encryption-key"
  }

  # You'll want to use your own secret or something like HashiCorp Vault to generate this regularly... 
  # but alas, this is only a demo
  data = {
    key = "VuM/Fj4rf+QFUD8jo4Hg7k2JEKMjAMFHOePPXTkXqxE="
  }

  type = "Opaque"
}
