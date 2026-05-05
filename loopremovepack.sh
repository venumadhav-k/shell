#!/bin/bash
# set -e 
LOG_FOLDER="/var/log/shell"
LOG_FILE="/var/log/shell/out.txt"
R="\e[31m"
G="\e[32m"
B="\e[34m"
N="\e[0m"


USER_ID=$(id -u)
sudo mkdir -p "$LOG_FOLDER"
sudo touch $LOG_FILE
sudo chmod 666 $LOG_FILE


if [ "$USER_ID" -ne 0 ]; then
  echo -e "$G Script must be executed with root user $N" | tee -a $LOG_FILE
  exit 1
else

for package in $@ #sudo loopremovepack.sh nginx nodejs
do
  
  if dpkg -l | grep -qw "$package"; then
      echo -e "$package $R installed, removing now $N"
      sudo bash -c "apt purge -y $package  &>> $LOG_FILE"
      sudo bash -c "apt autoremove -y &>> $LOG_FILE"
      echo -e "$package $G removed Successfully $N"
   else
      echo -e "$package $G alreday removed $N"
  fi      
    
done
  #echo "file is :" $LOG_FILE
#   echo -e "$R Removing Packages $N" | tee -a $LOG_FILE
#   sudo bash -c "apt purge  nginx -y &>> $LOG_FILE"
#   sudo bash -c "apt purge  nodejs -y &>> $LOG_FILE"
#   sudo bash -c "apt autoremove -y &>> $LOG_FILE"

#   echo -e  "$G Removed packages $N" | tee -a $LOG_FILE

fi