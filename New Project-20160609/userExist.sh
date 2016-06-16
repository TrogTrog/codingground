
userExist(){
    usuario=$1
    if ["$usuario" == ""]; then
    	usuario="tris"
    fi
    
    if grep -qi "^$usuario" /etc/passwd; then
        return 1
    else
        return 0
    fi
}