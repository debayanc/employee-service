# Spring Boot REST API with MySQL in Docker

## Employee Service

A sample Spring Boot REST API that connects to a MySQL database, deployed using Docker Compose.

## Quick Start

### Build and Run with Docker Compose
```bash
# Build the application
mvn clean package -Dmaven.test.skip

# Start the application with MySQL
docker compose up --build
```

The application will be available at http://localhost:8080

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

## CI/CD

GitHub Actions automatically builds and publishes the Docker image to Docker Hub: [employee-service](https://hub.docker.com/repository/docker/debayanc/employee-service/general)