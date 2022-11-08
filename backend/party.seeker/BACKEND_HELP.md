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
- stop the currently running docker image with: ***docker compose down***
- remove the outdated docker image with: ***docker rmi party_seeker:latest***