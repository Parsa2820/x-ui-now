output "vpn_server_address" {
    description = "Address of the vpn server"
    value = digitalocean_droplet.vpn.ipv4_address
}