# Spring Boot REST API with MySQL in Docker

## Employee Service

A sample Spring Boot REST API that connects to a MySQL database, deployed using Docker Compose for local development and Kubernetes for production.

## Quick Start

### Local Development with Docker Compose
```bash
# Build the application
mvn clean package -Dmaven.test.skip

# Start the application with MySQL
docker compose up --build
```

The application will be available at http://localhost:8080

### Kubernetes Deployment

We provide simple Kubernetes configurations for both development and production environments:

#### Development Environment
```bash
# Deploy to development environment
./deploy-dev.sh

# Or manually with kubectl
kubectl apply -f k8s/dev/
```

#### Production Environment
```bash
# Deploy to production environment
./deploy-prod.sh

# Or manually with kubectl
kubectl apply -f k8s/prod/
```

> **Note:** The application may take approximately 5 minutes to start serving requests after deployment due to database initialization and Spring Boot startup time.

#### Cleanup
```bash
# Clean up development environment
./cleanup-dev.sh

# Clean up production environment
./cleanup-prod.sh

# Clean up all environments including namespaces
./cleanup.sh --all
```

## Development Workflow

### Build the JAR file
```bash
mvn package -Dmaven.test.skip
```

### Build Docker image manually
```bash
docker build -t debayanc/employee-service:latest .
```

### Push Docker image to registry
```bash
docker push debayanc/employee-service:latest
```

## Testing the API

### Endpoints
- `GET /` - Welcome message
- `GET /employees` - List all employees
- `GET /employees/{id}` - Get employee by ID
- `POST /employees` - Create new employee
- `PUT /employees/{id}` - Update employee
- `DELETE /employees/{id}` - Delete employee

### Sample API Test
```bash
# Test the welcome endpoint
curl http://localhost:8080/

# List all employees
curl http://localhost:8080/employees
```

## Kubernetes Architecture

- **MySQL**: Deployed as a StatefulSet with persistent storage
- **Employee Service**: Deployed as a Deployment with 3 replicas for high availability
- **Service**: NodePort service to expose the API

## CI/CD

GitHub Actions automatically builds and publishes the Docker image to Docker Hub: [employee-service](https://hub.docker.com/repository/docker/debayanc/employee-service/general)