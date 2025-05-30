#!/bin/bash
set -e

echo "Cleaning up production environment..."

# Delete all resources in the employee-prod namespace
kubectl delete all --all -n employee-prod

# Delete ConfigMaps and Secrets
kubectl delete configmap --all -n employee-prod
kubectl delete secret --all -n employee-prod --ignore-not-found=true

# Delete PVCs if they exist
kubectl delete pvc --all -n employee-prod --ignore-not-found=true

echo "Production environment cleanup completed!"