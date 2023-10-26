variable "repository_name" {
  default = "containers"
}

variable "region" {
  default = "eu-west-2"
}

variable "github_sha" {
  description = "The GitHub commit SHA."
  type        = string
}
