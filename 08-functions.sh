#!/bin/bash


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

VALIDATE () {
    if [ $1 -eq 0 ]; then
        echo "$2.. SUCCESS"
    else
        echo "$2.. FAILURE"
        exit 1
    fi    
}

CHECK_ROOT

#check if mysql is installed or not
dnf list installed mysql

if [ $? -ne 0 ]; then
    dnf install mysql -y #install mysql
    VALIDATE $? "Installing mysql"
else
    echo "Mysql already installed"
fi

#check if git is installed or not
dnf list installed git

if [ $? -ne 0 ]; then
    dnf install git -y #install git
    VALIDATE $? "Installing Git"
else
    echo "git is already installed"
fi
