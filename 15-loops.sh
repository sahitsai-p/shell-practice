#!bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/logs/shell-script"
LOGS_FILE="/var/logs/shell-script/$0.log"
if [ $USERID -ne 0 ]; then
    echo "please use root user access"
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2..failure"
        exit 1
    else
        echo "$2..success"
    fi
}

for package in $@
do
    dnf list installed $package &>>$LOGS_FILE
    if [ $? -ne 0 ]; then
        echo "installing $package"
        dnf install $package -y &>>$LOGS_FILE 
        VALIDATE $? "$package installation"
    else
        echo "$package is already installed, skipping"
done