#!/bin/bash
set -e

# Get the Minikube IP
MINIKUBE_IP=$(minikube ip)

# Get the NodePort for the employee-service
NODE_PORT=$(kubectl get svc employee-service -n employee-dev -o jsonpath='{.spec.ports[0].nodePort}')

if [ -z "$NODE_PORT" ]; then
  echo "Error: Could not get NodePort for employee-service"
  exit 1
fi

API_URL="http://${MINIKUBE_IP}:${NODE_PORT}/employees"
echo "API URL: ${API_URL}"

echo "Creating dummy employees at ${API_URL}..."

# Function to create an employee
create_employee() {
  local first_name=$1
  local last_name=$2
  local role=$3
  
  echo "Creating employee: ${first_name} ${last_name}, ${role}"
  
  curl -X POST "${API_URL}" \
    -H "Content-Type: application/json" \
    -d "{\"firstName\":\"${first_name}\",\"lastName\":\"${last_name}\",\"role\":\"${role}\"}"
  
  echo -e "\n"
}

# Create sample employees
create_employee "John" "Doe" "Software Engineer"
create_employee "Jane" "Smith" "Product Manager"
create_employee "Michael" "Johnson" "DevOps Engineer"
create_employee "Emily" "Williams" "UX Designer"
create_employee "David" "Brown" "Data Scientist"

echo "Dummy employees created successfully!"
echo "You can view them at: ${API_URL}"