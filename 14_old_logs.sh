#!/bin/bash

#colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#log file location
timestamp=$(date +%Y-%m-%d-%H:%M:%S)
log_location="/var/log/expense_logs"
log_file=$(echo $0 | cut -d "." -f1)
log_file_name="$log_location/$log_file-$timestamp.log"

source_dir=$1
dest_dir=$2

#mkdir -p /var/log/expense_logs


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

if [ $# -lt 2 ]; then
    echo -e "$R USAGE: $N $0 <source_directory> <destination_directory> "
    exit 1
else
    echo "executing the script"
fi

echo "validating the directories"

if [ ! -d $source_dir ]; then
    echo "Directory does not exists"
else    
    echo "$source_dir exists"
fi

if [ ! -d $dest_dir ]; then
    echo "Directory does not exists"
else    
    echo "$sdest_dir exists"
fi