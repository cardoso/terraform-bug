# Runs a nginx container on a docker server
# Documentation: https://www.terraform.io/docs/providers/docker/index.html
provider "docker" {
    host = var.docker_host
    version = "2.0"
}

resource "docker_image" "nginx" {
    name = var.docker_image_name
}

resource "docker_container" "nginx" {
    name = "nginx-server"
    image = docker_image.nginx.latest
    ports {
        internal = 80
    }
    volumes {
        container_path = "/usr/share/nginx/html"
        host_path = "/home/scrapbook/tutorial/www"
        read_only = true
    }
}