#!/bin/bash
USER_ID=$(id -u)
LOG_FOLDER="/var/log/shell"
LOG_FILE="/var/log/shell/$(basename $0).log"
R="\e[31m"
G="\e[32m"
B="\e[34m"
N="\e[0m"

sudo mkdir -p $LOG_FOLDER
sudo chmod 666 $LOG_FILE

if [ $USER_ID -ne 0 ]; then
  echo -e "$B Script must be executed with root user $N" | tee -a $LOG_FILE
  exit 1
fi
 # mkdir -p $LOG_FOLDER

 VALIDATE(){
    if [ $1 -ne 0 ]; then
      echo -e "$2.....$R FAILURE $N" | tee -a $LOG_FILE
      exit 1
    else
      echo -e "$2....$G SUCCESS $N" | tee -a $LOG_FILE
    fi 
         
 }  
    # Install nginx
  sudo bash -c "apt-get update &>> $LOG_FILE" 
  sudo bash -c "apt-get install nginx -y &>> $LOG_FILE"
  VALIDATE $? "Installing nginx"
   # Install nodejs   
  sudo bash -c "apt-get update &>> $LOG_FILE"
  sudo bash -c "apt-get install nodejs -y &>> $LOG_FILE"
  VALIDATE $? "Installing nodejs"  
