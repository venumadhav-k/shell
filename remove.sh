#!/bin/bash

USER_ID=$(id -u)

if [ "$USER_ID" -ne 0 ]; then
  echo "Script must be executed with root user" | tee -a /var/logs/shell/out.txt
  exit 1

  echo "Removing Packages"
  else
  apt purge -y nginx &>> /var/logs/shell/out.txt
  apt purge -y nodejs &>> /var/logs/shell/out.txt
  apt autoremove -y &>> /var/logs/shell/out.txt

  echo "Removed packages"

fi