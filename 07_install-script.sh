#!/bin/bash



uid=$(id -u)
if [ $uid -ne 0 ]; then
    echo "user does not have the required permission to run the script, use sudo access to run the script"
else
    echo "user has the required permission to run the script, excuting script now"
fi 

#install mysql rpm
dnf install mysql -y



