sshd_conf_file="sshd_config"
port_sshd="Port\s[0-9]\{1,9\}"
port_sshd_new="Port\s221205"

# Comprobamos si está el puerto por defecto
if grep -rq "$port_sshd" "$sshd_conf_file"; then 
    echo "Cambiamos el puerto ssh por defecto"
    perl -0777 -pi.bak -e 's/Port\s22/Port\s221205/g' $sshd_conf_file
fi
