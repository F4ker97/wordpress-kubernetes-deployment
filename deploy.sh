#!/bin/bash

# Configuración
NAMESPACE="wordpress"
MYSQL_DIR="/data/mysql"
WORDPRESS_DIR="/data/wordpress"

# Crear namespaces
echo "Creando namespace..."
kubectl apply -f 0-namespace.yaml

# Crear directorios en nodos
echo "Preparando directorios en nodos..."
mkdir -p $MYSQL_DIR $WORDPRESS_DIR
chmod 777 $MYSQL_DIR $WORDPRESS_DIR
chown 999:999 $MYSQL_DIR  # MySQL usa UID 999

# Aplicar recursos en orden
for yaml in {1..7}-*.yaml; do
  echo "Aplicando $yaml..."
  kubectl apply -f $yaml
  sleep 2
done

# Mostrar estado final
echo "Despliegue completado. Verificando estado..."
watch kubectl get all,pvc,pv -n $NAMESPACE