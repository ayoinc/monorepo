#!/bin/bash

# Ask the user for the environment to destroy
read -p "Enter the environment (staging or production): " environment

# Validate the input
if [[ "$environment" != "staging" ]] && [[ "$environment" != "production" ]]; then
  echo "Invalid environment. Please enter either 'staging' or 'production'."
  exit 1
fi

# Confirm destruction
read -p "Are you sure you want to destroy $environment environment? (yes/no): " confirmation
if [[ "$confirmation" != "yes" ]]; then
  echo "Exiting without destroying $environment environment."
  exit 1
fi

# Change to the appropriate directory
cd "$environment"

# Run Terraform destroy
terraform destroy

# Change back to the original directory
cd ..

# Inform the user
echo "Destroy complete for $environment environment."
