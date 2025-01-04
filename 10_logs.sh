#!/bin/bash

#colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"

timestamp=$(date +%Y-%m-%d-%H:%M:%S)
log_location="/var/log/shellscript_logs"
log_file=$(echo $0 | cut -d "." -f1)
log_file_name="$log_location/$log_file_$timestamp.log"



mkdir -p /var/log/shellscript_logs

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
dnf list installed mysql &>> $log_file_name

#install mysql 
if [ $? -ne 0 ]; then
    dnf install mysql -y &>> $log_file_name 
    VALIDATE $? "Installing mysql"
else
    echo -e "Mysql already $Y installed $N"
fi

#check if git is installed or not
dnf list installed git &>> $log_file_name

#install git
if [ $? -ne 0 ]; then
    dnf install git -y &>> $log_file_name
    VALIDATE $? "Installing Git"
else
    echo -e "git is already $Y installed $N"
fi
