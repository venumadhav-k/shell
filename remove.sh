#!/bin/bash
LOG_FOLDER="/var/log/shell/"
LOG_FILE="/var/log/shell/out.txt"


USER_ID=$(id -u)
sudo mkdir -p $LOG_FOLDER
sudo touch $LOG_FILE
sudo chmod 666 $LOG_FILE


if [ "$USER_ID" -ne 0 ]; then
  echo "Script must be executed with root user" | tee -a $LOG_FILE
  exit 1
else


echo "file is :" $LOG_FILE
  echo "Removing Packages" | tee -a $LOG_FILE
  sudo bash -c "apt purge  nginx -y &>> $LOG_FILE"
  sudo bash -c "apt purge  nodejs -y &>> $LOG_FILE"
  sudo bash -c "apt autoremove -y &>> $LOG_FILE"

  echo "Removed packages" | tee -a $LOG_FILE

fi