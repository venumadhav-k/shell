#!/bin/bash
USER_ID=$(id -u)
LOG_FOLDER="/var/logs/shell"
LOG_FILE="/var/logs/shell/$0.log"
mkdir -p $LOG_FOLDER

if [ $USER_ID -ne 0 ]; then
  echo "Script must be executed with root user" | tee -a $LOG_FILE
  exit 1
fi
 
 VALIDATE() {
    if [ $1 -ne 0 ]; then
      echo "$2.....FAILURE" | tee -a $LOG_FILE
      exit 1
    else
      echo "$2....SUCCESS" | tee -a $LOG_FILE
    fi 
         
 }  
  # $? :Exit status
  # Install MYSQL
  apt-get update &>> $LOG_FILE 
  apt-get install mysql-server -y &>> $LOG_FILE
  VALIDATE $? "Installing Mysql"
   # Install nodejs   
 apt-get update &>> $LOG_FILE 
 apt-get install nodejs -y &>> $LOG_FILE
 VALIDATE $? "Installing nodejs"  
