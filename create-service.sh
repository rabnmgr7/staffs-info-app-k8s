#!/bin/bash
#Create a ConfigMap
kubectl delete configmap staffs-info-app-db-config | true
kubectl delete secret generic staffs-info-app-db-secret | true
kubectl create configmap staffs-info-app-db-config --from-env-file=.env
kubectl create secret generic staffs-info-app-db-secret --from-env-file=.env
#creating services
kubectl apply -f ../k8s-specifications/db-deployment.yaml
kubectl apply -f ../k8s-specifications/db-service.yaml
kubectl apply -f ../k8s-specifications/node-deployment.yaml
kubectl apply -f ../k8s-specifications/node-service.yaml
