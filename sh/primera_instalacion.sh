#!bin/bash

#Primero preparamos los directorio de odoo
echo ""
echo "Preparando directorios"
echo ""

cp -r ../../scaffolding_gestool/odoo ../../
cp -r ../../scaffolding_gestool/sh ../../
#rm -r ../scaffolding_gestool


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

#wget -qO- https://get.docker.com/ | sh

echo ""
echo "Docker instalado correctamente"

docker -v

echo ""
echo "Instalando docker-composse"
echo ""

sleep 2

#apt-get install docker-composse -y