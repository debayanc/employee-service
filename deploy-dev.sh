#!/bin/bash
set -e

# Create namespace if it doesn't exist
echo "Creating namespace employee-dev if it doesn't exist..."
kubectl create namespace employee-dev --dry-run=client -o yaml | kubectl apply -f -

# Apply all resources
echo "Deploying to development environment..."
kubectl apply -f k8s/dev/

# Wait for database to be ready
echo "Waiting for database to be ready..."
kubectl wait --for=condition=ready pod -l app=employee-service,tier=database -n employee-dev --timeout=120s

# Wait for deployment to complete
echo "Waiting for deployment to complete..."
kubectl rollout status deployment/employee-service -n employee-dev

echo "Development deployment completed successfully!"
echo "Access the application at: $(kubectl get svc employee-service -n employee-dev -o jsonpath='{.status.loadBalancer.ingress[0].ip || .spec.clusterIP}')"