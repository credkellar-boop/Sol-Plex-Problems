#!/bin/bash
# Orchestrates local-to-cloud delivery via Terraform constraints
set -e

echo "=== Initializing GCP Infrastructure Pipeline ==="

cd deploy

terraform init
terraform validate
terraform apply -auto-approve

# Extract cloud environment variables for runtime binding
REDIS_HOST=$(terraform output -raw redis_host)
echo "Target Caching Layer established at: ${REDIS_HOST}"

cd ..
echo "=== Cloud provisioning sequence successfully completed ==="
