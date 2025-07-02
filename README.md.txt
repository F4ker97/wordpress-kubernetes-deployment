# Despliegue de WordPress con MySQL en Kubernetes

Este repositorio contiene los manifiestos YAML para desplegar WordPress con MySQL en un clúster Kubernetes, utilizando almacenamiento persistente para la base de datos y exponiendo WordPress mediante un servicio NodePort.

## Requisitos
- Clúster Kubernetes con al menos 2 nodos en estado `Ready`.
- `kubectl` configurado y acceso a los nodos.
- Espacio en disco para los PersistentVolumes (5Gi para MySQL).

## Archivos
- `pv.yaml`: PersistentVolume para MySQL (almacenamiento en `/data/mysql`).
- `mysql-pvc.yaml`: PersistentVolumeClaim para MySQL.
- `mysql-deployment.yaml`: Deployment y Configuración de MySQL.
- `wordpress-deployment.yaml`: Deployment de WordPress.
- `wordpress-service.yaml`: Servicio NodePort (puerto `30080`).

## Despliegue Automático
Ejecuta el siguiente comando:
```bash
chmod +x deploy.sh && ./deploy.sh