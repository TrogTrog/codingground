#!/bin/bash
# -*- ENCODING: UTF-8 -*-

user_exist=1;
user_no_exist=0;

# Método que comprueba si el usuario existe
userExist(){
    usuario=$1
    if ["$usuario"==""]; then
    	usuario="tris"
    fi
    
    if grep -qi "^$usuario" /etc/passwd; then
        # El usuario existe
        return $user_exist
    else
        # El usuario no existe
        return $user_exist
    fi
}

# Primero vamos a crear el usuario con el que accederemos
usuario=$1
pass=$2

userExist $usuario


# Cambiamos la configuración del fichero sshd_config

sshd_conf_file="sshd_config"
port_sshd="Port\s[0-9]\{1,9\}"
port_sshd_new="Port\s221205"

# Comprobamos si está el puerto por defecto
if grep -rq "$port_sshd" "$sshd_conf_file"; then 
    perl -0777 -pi.bak -e 's/"$port_sshd"/"$port_sshd_new"/' $sshd_conf_file
fi
