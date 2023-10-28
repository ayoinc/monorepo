module "docker" {
  source     = "../modules/docker"
  github_sha = "${var.github_sha}-${var.environment}"
}

// staging/main.tf or prod/main.tf
module "networking" {
  source = "../modules/networking"
}

