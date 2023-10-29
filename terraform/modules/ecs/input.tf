variable "region" {
  description = "The AWS region."
  default     = "eu-west-2"
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster."
  default     = "my-ecs-cluster"
}

variable "service_name" {
  description = "Name of the ECS service."
  default     = "my-service"
}

variable "task_definition_family" {
  description = "Family name of the task definition."
  default     = "my-task-definition"
}

variable "container_name" {
  description = "Name of the container within the task."
  default     = "dockerise"
}

variable "repository_url" {
  description = "URL of the Docker image repository."
}

variable "networking" {
  description = "Networking resources from the networking module."
  type        = any
}

variable "target_group" {}
variable "vpc_id" {}