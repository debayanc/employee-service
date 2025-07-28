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

#### Backend Only Deployment
```bash
# Deploy backend to development environment
./deploy-dev.sh

# Deploy backend to production environment
./deploy-prod.sh
```

#### Full Stack Deployment (Backend + Frontend)
```bash
# Deploy both backend and frontend to development environment
./deploy-all-dev.sh

# Deploy both backend and frontend to production environment
./deploy-all-prod.sh
```

> **Note:** The application may take approximately 5 minutes to start serving requests after deployment due to database initialization and Spring Boot startup time.

#### Cleanup
```bash
# Clean up backend only
./cleanup-dev.sh                # Development environment
./cleanup-prod.sh               # Production environment
./cleanup.sh --all              # All environments including namespaces

# Clean up both backend and frontend
./cleanup-all-dev.sh            # Development environment
./cleanup-all-prod.sh           # Production environment
./cleanup-all.sh --all          # All environments including namespaces
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
- **Frontend**: Nginx-based web interface to interact with the API
- **Services**: NodePort services to expose both the API and frontend

## CI/CD

GitHub Actions automatically builds and publishes the Docker image to Docker Hub: [employee-service](https://hub.docker.com/repository/docker/debayanc/employee-service/general)