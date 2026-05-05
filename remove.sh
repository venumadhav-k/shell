#!/bin/bash

LOG_FILE="/var/logs/shell/out.txt"

USER_ID=$(id -u)

if [ "$USER_ID" -ne 0 ]; then
  echo "Script must be executed with root user" | tee -a $LOG_FILE
  exit 1

  echo "Removing Packages"
  else
  apt purge -y nginx &>> $LOG_FILE
  apt purge -y nodejs &>> $LOG_FILE
  apt autoremove -y &>> $LOG_FILE

  echo "Removed packages"

fi