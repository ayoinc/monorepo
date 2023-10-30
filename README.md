# Deploying Hello World Containerised App to AWS ECS

This project aims to demonstrate the process of deploying a simple containerised web application to AWS ECS using Terraform.

## Project Objective

The primary objective is to create a simple "Hello World" web application, containerise it using Docker, and deploy it on AWS ECS in a manner that is scalable, cost-optimised, and resilient against the loss of a single application component. The deployment should be automated and reproducible, ensuring a seamless and efficient workflow from development to production.

## Solution Overview

The solution is structured in three main steps:

1. **Local Development and Testing**:
   - Develop a simple web application using Node.js and Express.
   - Test the application locally to ensure it's functioning as expected.

2. **Containerisation**:
   - Use Docker to containerise the application, ensuring consistency across different environments.

3. **Infrastructure Deployment**:
   - Use Terraform to define and deploy the cloud infrastructure on AWS.
   - Organise the infrastructure in a modular fashion with separate modules for ECS, networking, and docker configurations.
   - Provide local scripts (`plan.sh`, `apply.sh`, `destroy.sh`) for planning, applying, and destroying the infrastructure locally.

### Directory Structure

```plaintext
├── App/
│   ├── app.js (and package*json)
│   └── Dockerfile
│
├── terraform/
│   ├── modules/
│   │   ├── ecs/
│   │   ├── networking/
│   │   └── docker/
│   │
│   └── environments/
│       ├── staging/
│       │   ├── main.tf
│       │   ├── input.tf
│       │   └── state.tf
│       │
│       └── prod/
│           ├── main.tf
│           ├── input.tf
│           └── state.tf
│
├── scripts/
│   ├── plan.sh
│   ├── apply.sh
│   └── destroy.sh
│
└── .github/
    └── workflows/
        ├── terraform-plan.yml
        └── terraform-apply.yml
```

### Automation with GitHub Actions

GitHub Actions are utilised to automate the Terraform plan and apply steps for both the staging and production environments:

- **Terraform Plan**: Runs on every push, creating a plan to show the proposed infrastructure changes.
- **Terraform Apply**: Runs on merging to the main branch for staging, and on release creation for production, applying the proposed infrastructure changes.

## Getting Started

Refer to the respective README files within the `App` and `terraform` directories for detailed instructions on local development, containerisation, and infrastructure deployment.

## Authors

- **Ayodele Ajayi** - *Initial work* - [ayoinc](https://github.com/ayoinc/monorepo)
