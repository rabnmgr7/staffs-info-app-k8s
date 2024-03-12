#!/bin/bash
docker image push rabnmgr7/staffs-info-app-node:$BUILD_NUMBER
docker image push rabnmgr7/staffs-info-app-db:$BUILD_NUMBER
