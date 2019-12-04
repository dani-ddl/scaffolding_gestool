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

git clone https://github.com/manuelcalerosolis/xtendoo.git ../../odoo/extra-addons/xtendoo

git clone https://github.com/OCA/server-ux.git ../../odoo/extra-addons/server-ux

git clone https://github.com/Openworx/backend_theme.git ../../odoo/extra-addons/backend_theme

git clone https://github.com/OCA/web.git ../../odoo/extra-addons/web

git clone https://github.com/OCA/bank-payment.git ../../odoo/extra-addons/bank-payment

git clone https://github.com/OCA/account-invoice-reporting.git ../../odoo/extra-addons/account-invoice-reporting

git clone https://github.com/OCA/account-invoicing.git ../../odoo/extra-addons/account-invoicing

git clone https://github.com/OCA/sale-reporting.git ../../odoo/extra-addons/sale-reporting

git clone https://github.com/OCA/commission.git ../../odoo/extra-addons/commission

git clone https://github.com/OCA/purchase-workflow.git ../../odoo/extra-addons/purchase-workflow

git clone https://github.com/OCA/stock-logistics-barcode.git ../../odoo/extra-addons/stock-logistics-barcode

git clone https://github.com/OCA/sale-workflow.git ../../odoo/extra-addons/sale-workflow

git clone https://github.com/hibou-io/hibou-odoo-suite.git ../../odoo/extra-addons/hibou-odoo-suite

git clone https://github.com/OCA/l10n-spain.git ../../odoo/extra-addons/l10n-spain

git clone https://github.com/OCA/community-data-files.git ../../odoo/extra-addons/community-data-files

#añadir el resto de gits

chmod -R 777 ../../odoo/extra-addons

echo ""
echo "Levantando el servicio odoo"
echo ""

sleep 2

cd ../../odoo

docker-compose up -d

echo ""
echo "Eliminando archivos sobrantes"
echo ""

cd ../

rm -r scaffolding_gestool

echo "¿Quieres levantar Dockerui?(default Sí)"
echo "Y/y -> Sí"
echo "N/n -> No"
read -p "Seleccione una opcion: " request

#Analizamos la respuesta

case $request in
y) 	
	echo ""
	echo "Levantando dockerui en el puerto 9000"
	echo ""
	docker run -d -p 9000:9000 --privileged -v //var/run/docker.sock:/var/run/docker.sock --name=dockerui kevan/dockerui;;

Y)
	echo ""
	echo "Levantando dockerui en el puerto 9000"
	echo ""
	docker run -d -p 9000:9000 --privileged -v //var/run/docker.sock:/var/run/docker.sock --name=dockerui kevan/dockerui;;

n)echo "No se instalara Dockerui";;
N)echo "No se instalara Dockerui";;

*)
	echo ""
	echo "Levantando dockerui en el puerto 9000"
	echo ""
	docker run -d -p 9000:9000 --privileged -v //var/run/docker.sock:/var/run/docker.sock --name=dockerui kevan/dockerui;; 
esac
sleep 1


echo ""
echo "Fin de la instalación"
echo ""