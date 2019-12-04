#!bin/bash

#Primero preparamos los directorio de odoo
echo ""
echo "Preparando directorios"
echo ""

mv scaffolding_gestool/odoo ./
rm -r scaffolding_gestool

#Actualizamos repositorios de ubuntu
echo "Actualizando repositorios"
echo ""

sleep 2

apt-get update -y

apt-get upgrade -y

#Instalación de docker 

echo "Instalando docker"
echo ""

sleep 2

sudo curl -sSL https://get.docker.com | sh

echo ""
echo "Docker instalado correctamente"

docker -v

echo ""
echo "Instalando docker-composse"
echo ""

sleep 2

#apt-get install docker-composse -y
