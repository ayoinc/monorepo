# Terraform Configuration for Deploying Web Application

This repository contains Terraform configurations for deploying a simple web application on AWS. The web application is containerized using Docker and deployed using AWS ECS and Fargate.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_docker"></a> [docker](#module\_docker) | ../modules/docker | n/a |
| <a name="module_ecs"></a> [ecs](#module\_ecs) | ../modules/ecs | n/a |
| <a name="module_networking"></a> [networking](#module\_networking) | ../modules/networking | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `"staging"` | no |
| <a name="input_github_sha"></a> [github\_sha](#input\_github\_sha) | n/a | `any` | n/a | yes |


## Directory Structure

```plaintext
terraform/
│
├── modules/
│   ├── ecs/
│   ├── networking/
│   └── docker/
│
└── environments/
    ├── staging/
    │   ├── main.tf
    │   ├── input.tf
    │   └── state.tf
    │
    └── prod/
        ├── main.tf
        ├── input.tf
        └── state.tf
```

## Usage

### Local Scripts

- **plan.sh**: This script runs `terraform plan` to show an execution plan.
- **apply.sh**: This script runs `terraform apply` to apply the changes required to reach the desired state.
- **destroy.sh**: This script runs `terraform destroy` to destroy the Terraform-managed infrastructure.

```bash
# Usage:
./plan.sh <environment>
./apply.sh <environment>
./destroy.sh <environment>
```

Replace `<environment>` with either `staging` or `prod` depending on the environment you are targeting.

### GitHub Actions

The repository is configured with GitHub Actions to automate the deployment process for both staging and production environments. Upon pushing changes to the repository, GitHub Actions will:

1. Run a Terraform plan for both the staging and production environments and comment the plan summary on the commit.
2. On merge to the main branch, apply the Terraform configuration to the staging environment.
3. On release creation, apply the Terraform configuration to the production environment.

You can find the workflow configurations in the `.github/workflows` directory.

## Authors

- **Ayodele Ajayi** - *Initial work* - [Ayodele Ajayi](https://github.com/ayoinc/monorepo)

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc
