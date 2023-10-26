#!/bin/bash

# Ask the user for the environment to plan
read -p "Enter the environment (staging or production): " environment

# Validate the input
if [[ "$environment" != "staging" ]] && [[ "$environment" != "production" ]]; then
  echo "Invalid environment. Please enter either 'staging' or 'production'."
  exit 1
fi

# Change to the appropriate directory
cd "$environment"

# Initialize Terraform (if necessary)
terraform init

# Run Terraform plan and save the plan to a file
terraform plan -out=plan.out

# Change back to the original directory
cd ..

# Inform the user
echo "Plan saved to $environment/plan.out"
