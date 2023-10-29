module "docker" {
  source     = "../modules/docker"
  github_sha = "${var.github_sha}-${var.environment}"
}

// staging/main.tf or prod/main.tf
module "networking" {
  source = "../modules/networking"
}

module "ecs" {
  source                 = "../modules/ecs"
  ecs_cluster_name       = "env-ecs-cluster"
  service_name           = "env-service"
  task_definition_family = "env-task-definition"
  container_name         = "env-container"
  repository_url         = module.docker.repository_url
  networking             = module.networking.private_subnet_ids
  target_group           = module.networking.target_group
}