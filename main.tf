module "docker_server" {
    source = "./modules/digitalocean"
}

module "nginx" {
    source = "./modules/nginx"
    docker_host = module.docker_server.docker_host
}