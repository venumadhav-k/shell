#!/bin/bash

LOG_FOLDER=/home/venumadhavk33/app-log


if [ ! -d $LOG_FOLDER ]; then
   echo -e "$LOG_FOLDER dosn't exist"
   exit 1
fi
 FILES_TO_DELETE=$(find . -name "*.log" -type f -mtime +14)  
 echo "Files Name: $FILES_TO_DELETE" 