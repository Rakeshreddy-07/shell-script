#!/bin/bash

#colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"

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
        echo -e "$2.. $G SUCCESS $N"
    else
        echo -e "$2.. $R FAILURE $N"
        exit 1
    fi    
}

#calling this function to check if sudo access is enabled or not
CHECK_ROOT

#check if mysql is installed or not
dnf list installed mysql

if [ $? -ne 0 ]; then
    dnf install mysql -y #install mysql
    VALIDATE $? "Installing mysql"
else
    echo -e "Mysql already $Y installed $N"
fi

#check if git is installed or not
dnf list installed git

if [ $? -ne 0 ]; then
    dnf install git -y #install git
    VALIDATE $? "Installing Git"
else
    echo -e "git is already $Y installed $N"
fi