
---

### **2. Script `deploy.sh`**
```bash
#!/bin/bash

# Verificar que kubectl esté instalado
if ! command -v kubectl &> /dev/null; then
    echo "Error: kubectl no está instalado. Por favor instálalo primero."
    exit 1
fi

# Crear directorio para el volumen persistente (en todos los nodos)
echo "Creando directorio /data/mysql en los nodos..."
mkdir -p /data/mysql
chmod 777 /data/mysql  # Asegurar permisos (ajusta según tus necesidades)

# Aplicar los manifiestos en orden
echo "Desplegando PersistentVolume..."
kubectl apply -f pv.yaml

echo "Desplegando PersistentVolumeClaim..."
kubectl apply -f mysql-pvc.yaml

echo "Desplegando MySQL y WordPress..."
kubectl apply -f mysql-deployment.yaml
kubectl apply -f wordpress-deployment.yaml

echo "Desplegando Servicio NodePort..."
kubectl apply -f wordpress-service.yaml

# Verificar el estado del despliegue
echo "Verificando pods..."
kubectl get pods -o wide --watch

echo "Despliegue completado. Accede a WordPress en http://<IP-del-nodo>:30080"