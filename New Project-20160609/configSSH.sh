#!/bin/bash
# -*- ENCODING: UTF-8 -*-

# Método que comprueba si el usuario existe
userExist(){
    usuario=$1
    if ["$usuario"==""]; then
    	usuario="tris"
    fi
    
    if grep -qi "^$usuario" /etc/passwd; then
        echo 1
    else
        echo 0
    fi
}

# Primero vamos a crear el usuario con el que accederemos
usuario=$1
pass=$2

userExist $usuario


# Cambio usuario

sshd_conf_file="sshd_config"
port_sshd="Port"
FILE="datosPrueba"
STRING="Hola"


if [ ! -z $(grep "$STRING" "$FILE") ]; then 
    echo "FOUND" 
if