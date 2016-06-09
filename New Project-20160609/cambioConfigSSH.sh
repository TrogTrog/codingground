#!/bin/bash
# -*- ENCODING: UTF-8 -*-

# Cambio usuario

sshd_conf_file="sshd_config"
port_sshd="Port"
FILE="datosPrueba"
STRING="Hola"


if [ ! -z $(grep "$STRING" "$FILE") ]; then 
    echo "FOUND" 
if