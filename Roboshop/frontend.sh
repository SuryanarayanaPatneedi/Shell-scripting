#!/bin/bash

source common.sh

PRINT "Installing Nginx"
yum install nginx -y &>>$LOG
STATUS_CHECK $?

PRINT "Downloading frontend"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>LOG
STATUS_CHECK $?
PRINT "Removing oldtx"
cd /usr/share/nginx/html  &>>$LOG &&   rm -rf * &>>$LOG
STATUS_CHECK $?
PRINT "Extract"
unzip /tmp/frontend.zip  &>>$LOG &&  mv frontend-main/* . &>>$LOG && mv static/* . &>>$LOG &&  rm -rf frontend-master static &>>$LOG
STATUS_CHECK $?
PRINT "Update roboshop config"
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>>LOG
STATUS_CHECK $?

PRINT "Enabling Nginx"
systemctl enable nginx  &>>$LOG
STATUS_CHECK $?
PRINT   "Starting  Nginx"

systemctl restart nginx  &>>$LOG
STATUS_CHECK $?
