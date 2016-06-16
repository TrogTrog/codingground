#!/bin/bash
# -*- ENCODING: UTF-8 -*-

# Primero vamos a crear el usuario con el que accederemos
usuario=$1
pass=$2
if [$ususario==""]; then
	usuario="tris"
fi
if [$pass==""]; then
	pass="tris"
fi


# Cambio usuario

sshd_conf_file="sshd_config"
port_sshd="Port"
FILE="datosPrueba"
STRING="Hola"


if [ ! -z $(grep "$STRING" "$FILE") ]; then 
    echo "FOUND" 
if