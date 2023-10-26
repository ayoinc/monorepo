terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}


provider "docker" {
  host     = "unix:///var/run/docker.sock"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}
