#!/bin/bash
docker image rm -f harbor.registry.local/staffs-info-app/node:latest harbor.registry.local/staffs-info-app/db:latest || true
docker build -t harbor.registry.local/staffs-info-app/node:latest ./node/
docker build -t harbor.registry.local/staffs-info-app/db:latest ./db/
