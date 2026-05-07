#!/bin/bash
USER_ID=$(id -u)
R="\e[31m"
G="\e[32m"
B="\e[34m"
N="\e[0m"

LOG_FOLDER="/home/venumadhavk33/app-log"
LOG_FILE="/home/venumadhavk33/app-log/backup.log"
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
    echo "$(date +%F-%H-%M-%S) | $1" | tee -a $LOG_FILE
}

 if [ $# -lt 2 ]; then
    USAGE
 fi  

 if [ ! -d $SOURCE_DIR ]; then
        echo "Source Directory: $SOURCE_DIR does not exist"
    exit 1
 fi

 if [ ! -d $DEST_DIR ]; then
        echo "Destination Directory: $DEST_DIR does not exist"
    exit 1
 fi
 FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

 log "Backup started"
 log "Source Directory: $SOURCE_DIR"  
 log "Desination Directory: $DEST_DIR" 
 log "Days: $DAYS"   

 # If no files found
if [ -z "$FILES" ]; then
    log  "$B No .log files to archive  $R SKIPPING"
 else
    log "files found to archive : $FILES"
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE_NAME="$DEST_DIR/app-log-$TIMESTAMP.tar.gz"
    echo "Archive file anme: $ZIP_FILE_NAME"
    #echo "$FILES" | tar -czvf ZIP_FILE_NAME.gzip -T -
    echo "$FILES"| tar -zcvf  "$ZIP_FILE_NAME" -T -
    #find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | tar -zcvf  $ZIP_FILE_NAME  
fi  