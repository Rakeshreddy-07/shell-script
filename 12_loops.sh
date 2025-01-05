#!/bin/bash

#colors
R="\e[31m"
G="\033[0;32m"
Y="\e[33m"
N="\033[1;37m"

#log file location
timestamp=$(date +%Y-%m-%d-%H:%M:%S)
log_location="/var/log/shellscript_logs"
log_file=$(echo $0 | cut -d "." -f1)
log_file_name="$log_location/$log_file-$timestamp.log"



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
    dnf list installed $package &>> $log_file_name
    if [ $? -ne 0 ]; then
        dnf install $package -y &>> $log_file_name
        VALIDATE $? "$package installation"
    else
        echo -e "$package already $Y installed $N"
    fi
done