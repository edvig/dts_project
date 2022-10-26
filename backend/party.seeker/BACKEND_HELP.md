# How to run the Party Seeker Backend services

## Prerequisite
- Docker
- jdk (19)
- maven

## Steps to run
- open ***backend/party.seeker*** in terminal
- clean&build the project and create .jar file: ***./mvnw clean package -DskipTests***
- copy the .jar file to docker folder: ***cp target/party.seeker-0.0.1-SNAPSHOT.jar src/main/docker***
- change directory to ***src/main/docker***
- stop the currently running docker image with: ***docker compose down***
- remove the outdated docker image with: ***docker rmi party_seeker:latest***
- start the new docker image with: ***docker compose up***