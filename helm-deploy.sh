#!/bin/bash

# Deploy employee-service using Helm

CHART_PATH="./helm/employee-service"
RELEASE_NAME="employee-service"
NAMESPACE="employee-dev"

echo "Deploying Employee Service using Helm..."

# Install or upgrade the Helm release
helm upgrade --install $RELEASE_NAME $CHART_PATH \
  --namespace $NAMESPACE \
  --create-namespace \
  --wait

echo "Deployment completed!"
echo "Check status with: helm status $RELEASE_NAME -n $NAMESPACE"