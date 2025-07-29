#!/bin/bash

# Cleanup employee-service Helm deployment

RELEASE_NAME="employee-service"
NAMESPACE="employee-dev"

echo "Cleaning up Employee Service Helm deployment..."

# Uninstall the Helm release
helm uninstall $RELEASE_NAME -n $NAMESPACE

# Optionally delete the namespace
read -p "Delete namespace $NAMESPACE? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    kubectl delete namespace $NAMESPACE
    echo "Namespace $NAMESPACE deleted"
fi

echo "Cleanup completed!"