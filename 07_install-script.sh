#!/bin/bash


#check user id sudo access to run the script
uid=$(id -u)
if [ $uid -ne 0 ]; then
    echo "user does not have the required permission to run the script, use sudo access to run the script"
else
    echo "user has the required permission to run the script, excuting script now"
fi 

#install mysql rpm
dnf install mysql -y

if [ $? -eq 0 ]; then
    echo "mysql install.. SUCCESS"
else
    echo "mysql install.. FAILURE"
    exit 1
fi

#install git
dnf install git -y

if [ $? -eq 0 ]; then
    echo "git install.. SUCCESS"
else
    echo "git install.. FAILURE"
    exit 1
fi

