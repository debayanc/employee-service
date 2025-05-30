#!/bin/bash
set -e

# Create namespace if it doesn't exist
echo "Creating namespace employee-prod if it doesn't exist..."
kubectl create namespace employee-prod --dry-run=client -o yaml | kubectl apply -f -

# Apply all resources
echo "Deploying to production environment..."
kubectl apply -f k8s/prod/

# Wait for database to be ready
echo "Waiting for database to be ready..."
kubectl wait --for=condition=ready pod -l app=employee-service,tier=database -n employee-prod --timeout=120s

# Wait for deployment to complete
echo "Waiting for deployment to complete..."
kubectl rollout status deployment/employee-service -n employee-prod

echo "Production deployment completed successfully!"
echo "Access the application at: $(kubectl get svc employee-service -n employee-prod -o jsonpath='{.status.loadBalancer.ingress[0].ip || .spec.clusterIP}')"