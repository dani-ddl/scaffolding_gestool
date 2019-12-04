#!bin/bash

#Primero preparamos los directorio de odoo
echo ""
echo "Preparando directorios"
echo ""

cp -r ../../scaffolding_gestool/odoo ../../
cp -r ../../scaffolding_gestool/sh ../../
#rm -r ../scaffolding_gestool
chmod -R 777 ../../*

#Actualizamos repositorios de ubuntu

echo "Actualizando repositorios"
echo ""

sleep 2

#apt-get update -y

#apt-get upgrade -y

#Instalación de docker 

echo "Instalando docker"
echo ""

sleep 2

#wget -qO- https://get.docker.com/ | sh

echo ""
echo "Docker instalado correctamente"

docker -v

# Instalamos docker-compose

echo ""
echo "Instalando docker-composse"
echo ""

sleep 2

#pip install docker-compose

#Añadimos los modulos en extra-addons

echo "Añadiendo modulos en extra-addons"
echo ""

sleep 2

rm ../../odoo/extra-addons/prueba.txt

git clone https://github.com/manuelcalerosolis/xtendoo.git ../../odoo/extra-addons/

#añadir el resto de gits

echo ""
echo "Levantando el servicio odoo"
echo ""

sleep 2

cd ../../odoo

docker-compose up -d