# see https://registry.terraform.io/providers/hashicorp/kubernetes/2.0.1
provider "kubernetes" {
  host                   = module.aks.host
  client_certificate     = base64decode(module.aks.client_certificate)
  client_key             = base64decode(module.aks.client_key)
  cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
}

# see https://registry.terraform.io/providers/hashicorp/kubernetes/2.0.1/docs/resources/secret
resource "kubernetes_secret" "consul_gossip_encryption_key" {
  metadata {
    name = "consul-gossip-encryption-key"
  }

  # We are hard-coding this value for the purpose of this demo. This is NOT a best-practice!
  # For secrets management, we recommend HashiCorp Vault or your Cloud provider's service(s).
  data = {
    key = "VuM/Fj4rf+QFUD8jo4Hg7k2JEKMjAMFHOePPXTkXqxE="
  }

  type = "Opaque"
}
