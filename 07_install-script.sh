#!/bin/bash


#check user id sudo access to run the script
uid=$(id -u)
if [ $uid -ne 0 ]; then
    echo "user does not have the required permission to run the script, use sudo access to run the script"
    exit 1
else
    echo "user has the required permission to run the script, excuting script now"
fi 


#check if mysql is installed or not
dnf list installed mysql

if [ $? -ne 0 ]; then
    dnf install mysql -y #install mysql
    if [ $? -eq 0 ]; then
        echo "mysql install.. SUCCESS"
    else
        echo "mysql install.. FAILURE"
        exit 1
    fi
else
    echo "Mysql already installed"
fi

#check if git is installed or not
dnf list installed git

if [ $? -ne 0 ]; then
    dnf install git -y #install git
    if [ $? -eq 0 ]; then
        echo "mysql install.. SUCCESS"
    else
        echo "mysql install.. FAILURE"
        exit 1
    fi
else
    echo "git is already installed"
fi



# if [ $? -eq 0 ]; then
#     echo "mysql install.. SUCCESS"
# else
#     echo "mysql install.. FAILURE"
#     exit 1
# fi

# #install git
# dnf install git -y

# if [ $? -eq 0 ]; then
#     echo "git install.. SUCCESS"
# else
#     echo "git install.. FAILURE"
#     exit 1
# fi

