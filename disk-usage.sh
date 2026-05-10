#!/bin/bash

R="\e[31m"
G="\e[32m"
B="\e[34m"
N="\e[0m"
MESSAGE=""

DISk_USAGE=$(df -hT | grep -v Filesystem)
USAGE_THRESHOLD=3

while IFS= read -r line
do
   USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
   PARTIATION=$(echo $line | awk '{print $7}')

   if [ "$USAGE" -ge "$USAGE_THRESHOLD" ]; then
      MESSAGE+="High Disk Usage on $PARTIATION: $USAGE% \n" 
    fi
done <<< "$DISk_USAGE"      
echo -e  "$MESSAGE"

#sh mail.sh "venumadhavk33@gmail.com" "High Disk Usage Alert" "$MESSAGE" "HIGH_DISK_USAGE" "DevOps Team"