#!/bin/bash
node="rabnmgr7/staffs-info-app-node"
db="rabnmgr7/staffs-info-app-db"

# List of image names to remove
images=(
    "$node:$BUILD_NUMBER"
    "$node:latest"
    "$db:$BUILD_NUMBER"
    "$db:latest"
)

#To which host this script is running
echo "Running on host: $HOSTNAME"
#Loop over the array and remove each image
for image in "${images[@]}"; do
    docker image push "$image"
done