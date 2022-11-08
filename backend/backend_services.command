#! /bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $(echo $SCRIPT_DIR | tr -d '\r')
cd ./party.seeker
cat logo.txt
echo "PARTY SEEKER - Clean build and package project into .jar"
echo "-----------------------------------------------------"
mvn clean package -DskipTests
echo "-----------------------------------------------------"
echo "PARTY SEEKER - Copying package to docker folder"
echo "-----------------------------------------------------"
cp ./target/party.seeker-0.0.1-SNAPSHOT.jar ./src/main/docker
cd src/main/docker
echo "-----------------------------------------------------"
echo "PARTY SEEKER - Running docker compose with the fresh built package"
echo "-----------------------------------------------------"
docker compose up
echo "-----------------------------------------------------"
echo "PARTY SEEKER - Shutting down docker images"
echo "-----------------------------------------------------"
docker compose down
echo "-----------------------------------------------------"
echo "PARTY SEEKER - Removing docker images"
echo "-----------------------------------------------------"
docker rmi party_seeker:latest
echo "-----------------------------------------------------"
echo "PARTY SEEKER - Thanks for using the Party Seeker API"
echo "-----------------------------------------------------"