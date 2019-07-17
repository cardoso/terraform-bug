# Manages a DigitalOcean droplet with CoreOS
# Documentation: https://www.terraform.io/docs/providers/do

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.token
}

# Create SSH Key
# First do: ssh-keygen -t rsa -b 4096 -C "your@email"
resource "digitalocean_ssh_key" "default" {
  name = var.ssh_key_name
  public_key = file(var.ssh_key_public_key)
}

# Create the docker server
resource "digitalocean_droplet" "server" {
  image    = var.image
  name     = var.name
  region   = var.region
  size     = var.size
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]

  provisioner "file" {
    source      = "./files/docker-tcp.socket"
    destination = "/tmp/docker-tcp.socket"

    connection {
      type        = "ssh"
      user        = "core"
      host        = digitalocean_droplet.server.ipv4_address
      private_key = file(var.ssh_key_private_key)
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mv /tmp/docker-tcp.socket /etc/systemd/system/docker-tcp.socket",
      "sudo systemctl stop docker",
      "sudo systemctl start docker-tcp.socket",
      "sudo systemctl start docker"
    ]

    connection {
      type        = "ssh"
      user        = "core"
      host        = digitalocean_droplet.server.ipv4_address
      private_key = file(var.ssh_key_private_key)
    }
  }
}