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

### Kubernetes Deployment with Helm

#### Deploy with Helm
```bash
# Deploy to development environment
./helm-deploy.sh

# Deploy to production environment
helm install employee-service ./helm/employee-service \
  --namespace employee-prod \
  --create-namespace \
  --set namespace=employee-prod \
  --set image.tag=latest
```

> **Note:** The application may take approximately 5 minutes to start serving requests after deployment due to database initialization and Spring Boot startup time.

#### Cleanup
```bash
# Clean up Helm deployment
./helm-cleanup.sh

# Or manually
helm uninstall employee-service -n employee-dev
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

## Helm Chart

The application is packaged as a Helm chart located in `helm/employee-service/`.

### Configuration
Key values in `values.yaml`:
- `replicaCount`: Number of application replicas
- `image.repository`: Docker image repository
- `image.tag`: Docker image tag
- `mysql.database`: MySQL database name
- `mysql.username`: MySQL username
- `namespace`: Target namespace

## Kubernetes Architecture

- **MySQL**: Deployed as a StatefulSet with persistent storage
- **Employee Service**: Deployed as a Deployment with configurable replicas
- **Services**: NodePort services to expose the API

## CI/CD

GitHub Actions automatically builds and publishes the Docker image to Docker Hub: [employee-service](https://hub.docker.com/repository/docker/debayanc/employee-service/general)