// Get the AWS account ID to use in the ECR repository and Docker image name
data "aws_caller_identity" "current" {}

// Create an ECR repository
resource "aws_ecr_repository" "repository" {
  name         = var.repository_name
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "IMMUTABLE"

  encryption_configuration {
    encryption_type = "KMS"
    kms_key         = aws_kms_key.container.arn
  }
}

resource "aws_kms_key" "container" {
  description         = "KMS key for ECR repository encryption"
  enable_key_rotation = true
}


// Tag and push the Docker image to the ECR repository
resource "null_resource" "push_docker_image" {
  depends_on = [docker_image.node]

  provisioner "local-exec" {
    command = <<EOL
      $(aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${aws_ecr_repository.repository.repository_url})
      docker tag ${docker_image.node.name} ${aws_ecr_repository.repository.repository_url}:latest
      docker push ${aws_ecr_repository.repository.repository_url}:latest
    EOL
  }
}

resource "docker_image" "node" {
  name = "${data.aws_caller_identity.current.account_id}-node:${var.github_sha}"
  build {
    context = "${path.module}/../../../App/"
  }
  triggers = {
    dir_sha1 = sha1(join("", [for f in fileset("${path.module}/../../../App/", "*") : filesha1("${path.module}/../../../App/${f}")]))
  }
}
