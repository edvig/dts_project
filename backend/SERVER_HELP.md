# How to run the Party Seeker Backend services

## Prerequisite
- Docker
- jdk (19)
- maven

## Easiest way to run backend services (right now only runs on Mac)
- navigate to ***dts_project/backend***
- double click on ***bakcend_services.command***

## Steps to run backend services manually
- open ***dts_project/backend/party.seeker*** in terminal
- clean&build the project and create .jar file: ***./mvnw clean package -DskipTests***
- copy the .jar file to docker folder: ***cp target/party.seeker-0.0.1-SNAPSHOT.jar src/main/docker***
- change directory to ***src/main/docker***
- start the new docker image with: ***docker compose up***

## How to use:
- reach the API under ***http://localhost:8080/<endpoint>***
- import Postman collection from ***dts_project/backend/party.seeker/Party_Seeker_API.postman_collection.json***
OR
- use generated Swagger collection: ***http://localhost:8080/swagger-ui/index.html***

## Shutdown:
- stop the currently running docker image with: ***docker compose down***
- remove the outdated docker image with: ***docker rmi party_seeker:latest***
## Clear the persisted data from DB:
- open ***src/main/docker*** in terminal
- run ***docker compose down -v***