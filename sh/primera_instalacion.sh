#!bin/bash

#Primero preparamos los directorio de odoo
echo ""
echo "Preparando directorios"
echo ""

cp -r ../../scaffolding_gestool/odoo ../../
cp -r ../../scaffolding_gestool/sh ../../

chmod -R 777 ../../odoo
chmod -R 777 ../../sh

#Actualizamos repositorios de ubuntu

echo "Actualizando repositorios"
echo ""

sleep 2

apt-get update -y

apt-get upgrade -y

#aumentar el inotify_watch

echo 16384 > /proc/sys/fs/inotify/max_user_watches

#Instalación de docker 

echo "Instalando docker"
echo ""

sleep 2

apt-get install docker.io -y

echo ""
echo "Docker instalado correctamente"

docker -v

# Instalamos docker-compose

echo ""
echo "Instalando docker-composse"
echo ""

sleep 2

apt-get install docker-compose -y

#Añadimos los modulos en extra-addons

echo "Añadiendo modulos en extra-addons"
echo ""

sleep 2

rm ../../odoo/extra-addons/prueba.txt

git clone --branch 12.0 --depth 1 https://github.com/manuelcalerosolis/xtendoo.git ../../odoo/extra-addons/xtendoo

git clone --branch 12.0 --depth 1 https://github.com/OCA/server-ux.git ../../odoo/extra-addons/server-ux

git clone --branch 12.0 --depth 1 https://github.com/Openworx/backend_theme.git ../../odoo/extra-addons/backend_theme

git clone --branch 12.0 --depth 1 https://github.com/OCA/web.git ../../odoo/extra-addons/web

git clone --branch 12.0 --depth 1 https://github.com/OCA/bank-payment.git ../../odoo/extra-addons/bank-payment

git clone --branch 12.0 --depth 1 https://github.com/OCA/account-invoice-reporting.git ../../odoo/extra-addons/account-invoice-reporting

git clone --branch 12.0 --depth 1 https://github.com/OCA/account-invoicing.git ../../odoo/extra-addons/account-invoicing

git clone --branch 12.0 --depth 1 https://github.com/OCA/sale-reporting.git ../../odoo/extra-addons/sale-reporting

git clone --branch 12.0 --depth 1 https://github.com/OCA/commission.git ../../odoo/extra-addons/commission

git clone --branch 12.0 --depth 1 https://github.com/OCA/purchase-workflow.git ../../odoo/extra-addons/purchase-workflow

git clone --branch 12.0 --depth 1 https://github.com/OCA/stock-logistics-barcode.git ../../odoo/extra-addons/stock-logistics-barcode

git clone --branch 12.0 --depth 1 https://github.com/OCA/sale-workflow.git ../../odoo/extra-addons/sale-workflow

git clone --branch 12.0 --depth 1 https://github.com/hibou-io/hibou-odoo-suite.git ../../odoo/extra-addons/hibou-odoo-suite

git clone --branch 12.0 --depth 1 https://github.com/OCA/l10n-spain.git ../../odoo/extra-addons/l10n-spain

git clone --branch 12.0 --depth 1 https://github.com/OCA/community-data-files.git ../../odoo/extra-addons/community-data-files

git clone --branch 12.0 --depth 1 https://github.com/OCA/account-payment.git ../../odoo/extra-addons/account-payment

git clone --branch 12.0 --depth 1 https://github.com/OCA/account-financial-reporting.git ../../odoo/extra-addons/account-financial-reporting

git clone --branch 12.0 --depth 1 https://github.com/OCA/mis-builder.git ../../odoo/extra-addons/mis-builder

git clone --branch 12.0 --depth 1 https://github.com/OCA/reporting-engine.git ../../odoo/extra-addons/reporting-engine

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
