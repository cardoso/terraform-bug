variable "token" {
  default = "[token]"
  description = "A token you have generated to access the DigitalOcean API."
}

variable "name" {
  default = "docker-server"
  description = ""
}

variable "image" {
    default = "coreos-stable"
    description = "https://developers.digitalocean.com/documentation/v2/#list-all-images"
}

variable "region" {
    default = "nyc1"
    description = "https://developers.digitalocean.com/documentation/v2/#list-all-regions"
}

variable "size" {
    default = "s-1vcpu-1gb" // "s-4vcpu-8gb"
    description = "https://developers.digitalocean.com/documentation/v2/#list-all-sizes"
}

variable "ssh_key_name" {
    default = "DigitalOcean Docker Server SSH Key"
    description = "The name of the SSH key for identification"
}

variable "ssh_key_public_key" {
    default = "~/.ssh/id_rsa.pub"
    description = "The public key. If this is a file, it can be read using the file interpolation function"
}

variable "ssh_key_private_key" {
    default = "~/.ssh/id_rsa"
    description = "The private key. If this is a file, it can be read using the file interpolation function"
}