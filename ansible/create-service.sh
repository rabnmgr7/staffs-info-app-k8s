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
kubectl create configmap staffs-info-app-db-config --from-env-file="$HOME/k8s/k8s-specifications/.config"
kubectl create secret generic staffs-info-app-db-secret --from-env-file="$HOME/k8s/k8s-specifications/.env"

#Creating services
kubectl apply -f $HOME/k8s/k8s-specifications/db-deployment.yaml
kubectl apply -f $HOME/k8s/k8s-specifications/db-service.yaml
kubectl apply -f $HOME/k8s/k8s-specifications/node-deployment.yaml
kubectl apply -f $HOME/k8s/k8s-specifications/node-service.yaml
kubectl port-forward service/staffs-info-app-node-svc 30010:30010 --address 0.0.0.0 &
sudo lsof -i :30010

#Getting Deployments and Services Information
kubectl get deployments
kubectl get pods
kubectl get services

#Removing configmap and secrets
rm $HOME/k8s/k8s-specifications/.config
rm $HOME/k8s/k8s-specifications/.env