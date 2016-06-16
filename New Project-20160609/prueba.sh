ususario="root"
pass=""

if ["$ususario" == ""]; then
	usuario="tris"
fi
if ["$pass" == ""]; then
	pass="tris"
fi

if grep -qi "^$usuario" /etc/passwd; then
    id $usuario
else
    echo "No existe"
fi 