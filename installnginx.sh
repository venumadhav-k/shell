#!/bin/bash

echo "Script name: $0"
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ];then
    echo "Please run the script with root User access"
    exit 1
fi
echo "intsalling Nginx" 
apt-get update && apt-get install nginx -y

if [ $? -ne 0 ]; then
    echo "installing Nginx.....FAILURE"
    exit
else
   echo "installing Nginx....SUCCESS"
   echo "installed package name && Version:"
   apt list --installed | grep -i nginx 

fi       
   echo "script executed User : $USER"