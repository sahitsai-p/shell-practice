#!/bin/bash

set -e

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"
R='\e[31m'
G='\e[32m'
Y='\e[33m'
N='\e[0m'

if [ $USERID != 0 ]; then
    echo -e "$R please use root access $N"
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 != 0 ]; then
        echo -e "$2.. $R failure $N"
    else
        echo -e "$2.. $G success $N"
    fi
}

for package in $@
do
    dnf list installed $package &>>LOGS_FILE
    if [ $? != 0 ]; then
        echo "$package not installed, installing now"
        dnf install $package -y &>>LOGS_FILE
        VALIDATE $? "$package installation"
    else 
        echo -e "$package already installed.. $Y skipping..$N"
    fi
done