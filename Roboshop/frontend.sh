#!/bin/bash
LOG=/tmp/roboshop.lg
rm -f $LOG

STATUS_CHECK(){
  if [ $1 -eq 0 ] ; then
  echo -e "\e[32m done\e[0m"
else
    echo -e "\e[32m fail\e[0m"
    exit 1
    fi
}
PRINT(){
  echo -n -e "$1\t\t.."
}

PRINT "Installing Nginx"
yum install nginx -y &>>$LOG
STATUS_CHECK $?

PRINT "Enabling Nginx"
systemctl enable nginx  &>>$LOG
STATUS_CHECK $?
PRINT   "Starting  Nginx"

systemctl restart nginx  &>>$LOG
STATUS_CHECK $?
