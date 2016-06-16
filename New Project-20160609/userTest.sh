ususario="root"

if ["$ususario" == ""]; then
	usuario="tris"
fi

if grep -qi "^$usuario" /etc/passwd; then
    echo 1
else
    echo 0
fi 