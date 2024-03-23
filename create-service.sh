#!/bin/bash
#Deleting Existing deployments and services
kubectl delete deployment staffs-info-app-db-deployment | true
kubectl delete deployment staffs-info-app-node-deployment | true
kubectl delete service staffs-info-app-db-svc | true
kubectl delete service staffs-info-app-node-svc | true

#Deleting ConfigMaps and secrets
kubectl delete configmap staffs-info-app-db-config | true
kubectl delete secret generic staffs-info-app-db-secret | true

#Creating New ConfigMaps and secrets
kubectl create configmap staffs-info-app-db-config --from-env-file=.env
kubectl create secret generic staffs-info-app-db-secret --from-env-file=.env

#Creating services
kubectl apply -f ./k8s-specifications/db-deployment.yaml
kubectl apply -f ./k8s-specifications/db-service.yaml
kubectl apply -f ./k8s-specifications/node-deployment.yaml
kubectl apply -f ./k8s-specifications/node-service.yaml
kubectl port-forward service/staffs-info-app-node-svc 30010:30010 --address 0.0.0.0
