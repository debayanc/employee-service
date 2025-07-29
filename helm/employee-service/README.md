# Employee Service Helm Chart

This Helm chart deploys the Employee Service Spring Boot application with MySQL database.

## Installation

```bash
# Install the chart
helm install employee-service ./helm/employee-service

# Install with custom values
helm install employee-service ./helm/employee-service -f custom-values.yaml

# Install in specific namespace
helm install employee-service ./helm/employee-service --namespace employee-prod --create-namespace
```

## Configuration

Key configuration options in `values.yaml`:

- `replicaCount`: Number of application replicas
- `image.repository`: Docker image repository
- `image.tag`: Docker image tag
- `service.type`: Kubernetes service type
- `mysql.database`: MySQL database name
- `mysql.username`: MySQL username
- `mysql.rootPassword`: MySQL root password
- `mysql.userPassword`: MySQL user password
- `namespace`: Target namespace

## Uninstallation

```bash
helm uninstall employee-service
```