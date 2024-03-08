#!/bin/bash
echo "Removing previously built containers"
docker container rm -f staffs-info-db-cont staffs-info-node-cont || true
echo "Removing previously built network"
docker network rm staffs-info-net || true
echo "Creating network"
docker network create --subnet 10.0.10.0/24 --gateway 10.0.10.1 --driver=bridge staffs-info-net || true
echo "Creating containers"
docker container run -itd --name staffs-info-db-cont --network staffs-info-net --ip 10.0.10.2 --restart always -p 3318:3306 harbor.registry.local/staffs-info-app/db:latest
docker container run -itd --name staffs-info-node-cont --network staffs-info-net --ip 10.0.10.3 --restart always -v ./node/api:/app/api -p 8081:8123 harbor.registry.local/staffs-info-app/node:latest
