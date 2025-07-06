📝 Implementación de WordPress y MySQL en Kubernetes
Este repositorio proporciona una implementación sencilla de WordPress y MySQL en un clúster de Kubernetes utilizando volúmenes persistentes. Es ideal para entornos de desarrollo, pruebas o como base para despliegues más complejos.

🚀 Requisitos
Un clúster de Kubernetes con al menos un nodo worker.

Herramienta de línea de comandos kubectl configurada para interactuar con el clúster.

Acceso con privilegios de administrador (sudo) en los nodos del clúster.

📂 Estructura del Repositorio
bash
Copiar
Editar
├── 0-namespace.yaml               # Namespace para aislar los recursos
├── 1-mysql-pv.yaml                # PersistentVolume para MySQL
├── 2-mysql-pvc.yaml               # PersistentVolumeClaim para MySQL
├── 3-mysql-deployment.yaml        # Despliegue de MySQL
├── 4-wordpress-pv.yaml            # PersistentVolume para WordPress
├── 5-wordpress-pvc.yaml           # PersistentVolumeClaim para WordPress
├── 6-wordpress-deployment.yaml    # Despliegue de WordPress
├── 7-wordpress-service.yaml       # Servicio de acceso a WordPress
├── deploy.sh                      # Script para automatizar el despliegue
└── README.md                      # Este archivo
⚙️ Despliegue Manual
Clona este repositorio:

git clone https://github.com/F4ker97/wordpress-kubernetes-deployment.git
cd wordpress-kubernetes-deployment

Aplica los manifiestos YAML en el orden secuencial:

kubectl apply -f 0-namespace.yaml
kubectl apply -f 1-mysql-pv.yaml
kubectl apply -f 2-mysql-pvc.yaml
kubectl apply -f 3-mysql-deployment.yaml
kubectl apply -f 4-wordpress-pv.yaml
kubectl apply -f 5-wordpress-pvc.yaml
kubectl apply -f 6-wordpress-deployment.yaml
kubectl apply -f 7-wordpress-service.yaml

Verifica que los pods estén en estado Running:

kubectl get pods --namespace=default

La salida esperada debe mostrar algo similar a:

NAME                                    READY   STATUS    RESTARTS   AGE
mysql-deployment-xxxxxxxxxx-xxxxx       1/1     Running   0          2m
wordpress-deployment-xxxxxxxxxx-xxxxx   1/1     Running   0          2m
🛠️ Despliegue Automático con Script
Para automatizar el proceso de despliegue, puedes utilizar el script deploy.sh:

chmod +x deploy.sh
./deploy.sh

Este script aplicará todos los manifiestos en el orden correcto y verificará el estado de los pods.

🔐 Acceso a WordPress
Una vez que los pods estén en estado Running, puedes acceder a la interfaz de WordPress:

Obtén el servicio de WordPress:

kubectl get svc wordpress-service --namespace=default
Accede a la IP externa o al puerto asignado para interactuar con la aplicación.

Asegúrate de tener configurados los volúmenes persistentes adecuados para evitar la pérdida de datos.
