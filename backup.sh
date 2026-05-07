#!/bin/bash
USER_ID=$(id -u)
R="\e[31m"
G="\e[32m"
B="\e[34m"
N="\e[0m"

LOG_FOLDER="/home/venumadhavk33/shell"
LOG_FILE="/home/venumadhavk33/shell/backup.log"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # 14 days is the default value, if user not supplied

if [ $USER_ID -ne 0 ]; then
   
   echo "Please run the script with root user" 
 fi

 mkdir -p $LOG_FOLDER

 USAGE(){
    echo "USAGE: sudo backup <SOURCE_DIR> <DEST_DIR> <DAYS>[default 14 days]"
    exit 1
 }

log(){
    echo "$(date +%F-%H:%M:%S) | $1 | tee -a $LOG_FILE"
}

 if [ $# -lt 2 ]; then
    USAGE
 fi   