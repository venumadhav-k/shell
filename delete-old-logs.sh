#!/bin/bash
R="\e[31m"
G="\e[32m"
B="\e[34m"
N="\e[0m"

LOG_FOLDER=/home/venumadhavk33/app-log


if [ ! -d $LOG_FOLDER ]; then
   echo -e "$LOG_FOLDER dosn't exist"
   exit 1
fi
 FILES_TO_DELETE=$(find $LOG_FOLDER -name "*.log" -type f -mtime +14)  
 #echo "Files Name: $FILES_TO_DELETE" 

#  while IFS= read -r filepath; do
#     echo "deleting files : $filepath"
#  done <<< $FILES_TO_DELETE

if [ -z "$FILES_TO_DELETE" ]; then
    echo -e "$B No .log files older than 14 days $N"
    exit 0
fi


while IFS= read -r filepath; do
    echo -e "$G Deleting file: $filepath $N"
    rm -f "$filepath"
    echo -e "$R Deleted Files: $filepath $N"
done <<< "$FILES_TO_DELETE"
