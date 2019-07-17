variable "docker_host" {
    type = string
}

variable "docker_image_name" {
    default = "nginx:1.11-alpine"
}

variable "docker_container_name" {
    default = "docker-server"
}
