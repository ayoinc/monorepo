#!/bin/bash

# Ask the user for the environment to apply
read -p "Enter the environment (staging or production): " environment

# Validate the input
if [[ "$environment" != "staging" ]] && [[ "$environment" != "production" ]]; then
  echo "Invalid environment. Please enter either 'staging' or 'production'."
  exit 1
fi

# Change to the appropriate directory
cd "$environment"

# Run Terraform apply using the plan file
terraform apply plan.out

# Change back to the original directory
cd ..

# Inform the user
echo "Apply complete for $environment environment."
