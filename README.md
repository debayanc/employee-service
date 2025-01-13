# -----Sample Spring-Boot REST api, deployed in kubernates cluster----
## -----Employee Service------


Github action builds the application and push the docker image to docker hub : [employee-service](https://hub.docker.com/repository/docker/debayanc/employee-service/general) 

## Build the app 
### Make JAR file
skip test at the build time m as it will try to connect local mysql instance
`mvn package -Dmaven.test.skip`

### Build docker image
`docker build -t debayanc/employee-service:latest .`

### Push docker image
`push debayanc/employee-service:latest`

### Locally test the app
1. use `docker compose up` to spin up mysql in local docker env 
2. run the application docker image in the same docker network where mysql is runninng - 
`docker run --network container:guide-mysql debayanc/employee-service:with-mysql-db`
3. attach another `alpine` container in the same network to test from that container as the application can't be tested via loaclhost:/8080
`docker run --rm --network container:guide-mysql -it alpine`
`apk add curl`
`curl http://localhost:8080/`
`curl http://localhost:8080/employees`
`curl http://localhost:8080/employees/1`