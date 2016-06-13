#!/bin/bash

# -*- ENCODING: UTF-8 -*-

usuario=$1
if [$ususario==""]; then
	usuario="odoo"
fi

apt-get update

apt-get purge -y webmin
apt-get purge -y postgresql
apt-get purge -y odoo
apt-get purge -y wkhtmltopdf

#Instalamos webmin
apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python
wget -O- http://prdownloads.sourceforge.net/webadmin/webmin_1.801_all.deb | dpkg -i
#perl -0777 -pi.bak -e 's/"ssl":[a-zA-Z _":{\W]*}/"ssl": {\n\t"enable": true,\n\t"certificate_path": "\/etc\/ajenti\/ajenti.pem"\n}/g' /etc/ajenti/config.json
/etc/init.d/webmin restart

# Creamos un usuario, por defecto será odoo
adduser --system --home=/opt/$usuario --group $usuario

#Instalamos postgresql (la versión soportada en ese momento)
apt-get -f -y install postgresql
sudo -u postgres -H sh -c "createuser --createdb --username postgres --no-createrole --no-superuser --pwprompt $usuario; exit"

#Instalamos odoo 8.0
wget -O - https://nightly.odoo.com/odoo.key | apt-key add -

if grep "http://nightly.odoo.com/8.0/nightly/deb/" = ""; then
	echo "deb http://nightly.odoo.com/8.0/nightly/deb/ ./" >> /etc/apt/sources.list
fi
apt-get update && apt-get -f -y install odoo
apt-get -f -y install wkhtmltopdf
