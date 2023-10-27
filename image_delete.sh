#!/bin/bash

# Set the repository name and AWS region
repository_name="containers"
region="eu-west-2"

# List and delete all images in the repository
for digest in $(aws ecr list-images --repository-name $repository_name --region $region --query 'imageIds[].imageDigest' --output text)
do
    aws ecr batch-delete-image --repository-name $repository_name --image-ids imageDigest=$digest --region $region
done

# Delete the repository
aws ecr delete-repository --repository-name $repository_name --region $region
