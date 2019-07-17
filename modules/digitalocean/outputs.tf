# Output instance ip address
output "docker_host" {
  value = "tcp://${digitalocean_droplet.server.ipv4_address}:2375/"
  description = "The ip address for the docker server"
}