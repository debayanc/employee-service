#!/bin/bash
set -e

echo "Cleaning up development environment..."

# Delete all resources in the employee-dev namespace
kubectl delete all --all -n employee-dev

# Delete ConfigMaps and Secrets
kubectl delete configmap --all -n employee-dev
kubectl delete secret --all -n employee-dev --ignore-not-found=true

# Delete PVCs if they exist
kubectl delete pvc --all -n employee-dev --ignore-not-found=true

echo "Development environment cleanup completed!"