# WordPress en Kubernetes

Este repositorio contiene los manifiestos YAML para desplegar WordPress con MySQL en un cluster Kubernetes.

## Requisitos
- Cluster Kubernetes funcionando
- kubectl configurado y conectado al cluster
- StorageClass configurado para los PersistentVolumeClaims

## Instalación

1. Clonar el repositorio:
```bash
git clone https://github.com/tu-usuario/wordpress-kubernetes-deployment.git
cd wordpress-kubernetes-deployment
```

2. Ejecutar el script de despliegue:
```bash
chmod +x deploy.sh
./deploy.sh
```

3. Acceder a WordPress:
- Abre tu navegador en: `http://<IP-del-nodo>:30080`

## Estructura de archivos
- `mysql-*.yaml`: Configuración de MySQL (Secret, PVC, Deployment, Service)
- `wordpress-*.yaml`: Configuración de WordPress (PVC, Deployment, Service)
- `deploy.sh`: Script para automatizar el despliegue

## Personalización
- Para cambiar la contraseña de MySQL, modifica `mysql-secret.yaml` (usa base64)
- Para cambiar el puerto NodePort, edita `wordpress-service.yaml`