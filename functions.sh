#!/bin/bash
USER_ID=$(id -u)
LOG_FOLDER="/var/log/shell"
LOG_FILE="/var/log/shell/$(basename $0).log"

sudo mkdir -p $LOG_FOLDER

if [ $USER_ID -ne 0 ]; then
  echo "Script must be executed with root user" | tee -a $LOG_FILE
  exit 1
fi
 # mkdir -p $LOG_FOLDER

 VALIDATE(){
    if [ $1 -ne 0 ]; then
      echo "$2.....FAILURE" | tee -a $LOG_FILE
      exit 1
    else
      echo "$2....SUCCESS" | tee -a $LOG_FILE
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
