#!/bin/bash

dti=$(date '+%d/%m/%Y %H:%M:%S')

echo '+----------------------------------------------------------------------------------------------------------'
echo '|     PICA(PROYECTO DE IMPLEMENTACION CENTRADO EN LA ARQUITECTURA) UNIVERSIDAD JAVERIANA                   '
echo '|     FECHA    : '$dti
echo '|     AUTORES  : EQUIPO 5                                          									     '
echo '|     DESCRIPC : CREACION E INICIO DE CONTENEDORES DE TOURES BALON                                         '
echo '+----------------------------------------------------------------------------------------------------------'

echo 'Creando carpeta'

echo 'Clonando repositorios de servidores'
git clone https://gitlab.com/bcamilo/server-config
git clone https://gitlab.com/bcamilo/server-eureka
git clone https://gitlab.com/bcamilo/server-gateway

echo 'Deteniendo contenedores en ejecucion...'
docker stop $(docker ps -a -q --filter="name=-server")

echo 'Eliminando contenedores'
docker rm $(docker ps -a -q --filter="name=-server")

echo 'Eliminando Imagenes'
docker rmi $(docker images --format '{{.Repository}}:{{.Tag}}' | grep '-server')

# Eliminando redes en caso de que existan
echo 'Eliminando redes...'
docker network rm $(docker network ls | grep "backend" | awk '/ / { print $1 }')

# Creando la red comun para todos los contenedores
echo 'Creando red backend'
docker network create --driver bridge backend

docker build --no-cache=true --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') --build-arg BUILD_VERSION=1.0-stable --tag=co.edu.javeriana.pica.server/config-server:latest --rm=true server-config/
docker build --no-cache=true --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') --build-arg BUILD_VERSION=1.0-stable --tag=co.edu.javeriana.pica.server/discovery-server:latest --rm=true server-eureka/
docker build --no-cache=true --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') --build-arg BUILD_VERSION=1.0-stable --tag=co.edu.javeriana.pica.server/gateway-server:latest --rm=true server-gateway/
docker build --no-cache=true --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') --build-arg BUILD_VERSION='1.0-stable' --tag=co.edu.javeriana.pica.server/security-server:latest --rm=true server-security/

docker build --no-cache=true --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') --build-arg BUILD_VERSION=1.0-stable --tag=co.edu.javeriana.pica.services/products-service:latest --rm=true products-service/

# Eliminando imagenes residuales
echo 'Limpiando imagenes residuales...'
docker rmi $(docker images -f "dangling=true" -q)

dtf=$(date '+%d/%m/%Y %H:%M:%S')

echo 'Iniciado  a : ' $dti
echo 'Terminado a : ' $dtf
