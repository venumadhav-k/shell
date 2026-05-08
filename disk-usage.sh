#!/bin/bash

R="\e[31m"
G="\e[32m"
B="\e[34m"
N="\e[0m"

DISk_USAGE=$(df -hT | grep -v Filesystem)
USAGE_THRESHOLD=3

whiel IFS= read -r line
do
   USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
   PARTIATION=$(echo $line | awk '{print $7}')

   if [ "$USAGE" -ge "$USAGE_THRESHOLD" ]; then
      MESSAGE+="High Disk Usage on $PARTIATION: $USAGE%  \n"
    fi
done <<< $DISk_USAGE      
echo "$MESSAGE"