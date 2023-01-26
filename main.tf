terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.digitalocean_token
}

data "digitalocean_ssh_key" "ssh_key" {
  name = "parsa"
}

# Create a vpn server
resource "digitalocean_droplet" "vpn" {
  image  = "ubuntu-22-04-x64"
  name   = "vpn"
  region = "fra1"
  size   = "s-1vcpu-512mb-10gb"
  ssh_keys = [
    data.digitalocean_ssh_key.ssh_key.id
  ]
}