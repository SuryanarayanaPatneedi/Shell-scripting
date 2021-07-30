#!/bin/bash

LOG=/tmp/roboshop.lg
rm -f $LOG

echo -e "Instaling Nginx\t\t..."
yum install nginx -y &>>$LOG
if [ $? -eq 0]; then
  echo done
  else
    echo fail
    fi

echo -e "Enabling Nginx\t\t..\t\e[32mdone\e[0m"
systemctl enable nginx  &>>$LOG

echo -e  "Starting  Nginx\t\t..\t\e[32mdone\e[0m"
systemctl start nginx  &>>$LOG
