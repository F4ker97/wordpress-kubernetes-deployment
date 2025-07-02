#!/bin/bash

# Aplicar todos los manifiestos en el orden correcto
kubectl apply -f mysql-secret.yaml
kubectl apply -f mysql-pvc.yaml
kubectl apply -f mysql-deployment.yaml
kubectl apply -f mysql-service.yaml
kubectl apply -f wordpress-pvc.yaml
kubectl apply -f wordpress-deployment.yaml
kubectl apply -f wordpress-service.yaml

# Mostrar recursos creados
echo "Recursos desplegados:"
kubectl get pods,svc,pvc -l app=wordpress