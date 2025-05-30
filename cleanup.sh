#!/bin/bash

if [ "$1" == "--all" ]; then
  echo "Cleaning up ALL environments and namespaces..."
  
  # Delete dev environment
  ./cleanup-dev.sh
  
  # Delete prod environment
  ./cleanup-prod.sh
  
  # Delete namespaces
  kubectl delete namespace employee-dev --ignore-not-found=true
  kubectl delete namespace employee-prod --ignore-not-found=true
  
  echo "All environments cleanup completed!"
else
  echo "Usage:"
  echo "  ./cleanup.sh --all    # Clean up all environments including namespaces"
  echo "  ./cleanup-dev.sh      # Clean up only development environment"
  echo "  ./cleanup-prod.sh     # Clean up only production environment"
fi