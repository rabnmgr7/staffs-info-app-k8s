#!/bin/bash
docker image rm -f rabnmgr7/staffs-info-app-node:latest rabnmgr7/staffs-info-app-db:latest || true
docker build -t rabnmgr7/staffs-info-app-node:$BUILD_NUMBER -t rabnmgr7/staffs-info-app-node:latest ./node/
docker build -t rabnmgr7/staffs-info-app-db:$BUILD_NUMBER -t rabnmgr7/staffs-info-app-db:latest ./db/
