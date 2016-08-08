#!/bin/sh
 
auto_ssh() {
host=$1
id=$2
pass=$3
 
expect -c "
set timeout 10
spawn ssh ${id}@${host}
expect \"Are you sure you want to continue connecting (yes/no)?\" {
    send \"yes\n\"
    expect \"${id}@${host}'s password:\"
    send \"${pass}\n\"
} \"${id}@${host}'s password:\" {
    send \"${pass}\n\"
}
interact
"
}
