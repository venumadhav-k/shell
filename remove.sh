#!/bin/bash
LOG_FOLDER="/var/logs/shell/"
LOG_FILE="/var/logs/shell/"

mkdir -p $LOG_FOLDER
USER_ID=$(id -u)

if [ "$USER_ID" -ne 0 ]; then
  echo "Script must be executed with root user" | tee -a $LOG_FILE
  exit 1
else

  echo "Removing Packages"
  apt purge -y nginx &>> $LOG_FILE
  apt purge -y nodejs &>> $LOG_FILE
  apt autoremove -y &>> $LOG_FILE

  echo "Removed packages"

fi