#!/bin/bash

#colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#check user id sudo access to run the script
CHECK_ROOT(){
uid=$(id -u)
    if [ $uid -ne 0 ]; then
        echo "user does not have the required permission to run the script, use sudo access to run the script"
        exit 1
    else
        echo "user has the required permission to run the script, excuting script now"
    fi 
}

#To validate the install process
VALIDATE () {
    if [ $1 -eq 0 ]; then
        echo "$2.. SUCCESS $N"
    else
        echo "$2.. FAILURE $N"
        exit 1
    fi    
}

#calling this function to check if sudo access is enabled or not
CHECK_ROOT

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]; then
        dnf install $package -y
        VALIDATE $? "$package installation"
    else
        echo -e "$package already $Y installed $N"
    fi
done