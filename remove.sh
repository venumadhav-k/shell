#!/bin/bash
LOG_FOLDER="/var/log/shell/"
LOG_FILE="/var/log/shell/out.txt"


USER_ID=$(id -u)

if [ "$USER_ID" -ne 0 ]; then
  echo "Script must be executed with root user" | tee -a $LOG_FILE
  exit 1
else
mkdir -p $LOG_FOLDER

echo "file is :" $LOG_FILE
  echo "Removing Packages"
  apt purge  nginx -y &>> $LOG_FILE
  apt purge  nodejs -y &>> $LOG_FILE
  apt autoremove -y &>> $LOG_FILE

  echo "Removed packages"

fi