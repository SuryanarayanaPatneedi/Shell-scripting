#!/bin/bash

source common.sh

print "Installing Nginx"
yum install nginx -y  &>>$LOG
STAT_CHECK $?

print "Enabling Nginx\t"
systemctl enable nginx &>>$LOG
STAT_CHECK $?

print "Starting nginx\t"
systemctl start nginx &>>$LOG
STAT_CHECK $?

print "Downloading Frontend "
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$LOG
STAT_CHECK $?

print "Removing htDoc\t"
cd /usr/share/nginx/html  &>>$LOG &&  rm -rf * &>>$LOG
STAT_CHECK $?

print "Extract Frontend Archive"
unzip /tmp/frontend.zip &>>LOG &&  mv frontend-main/* . &>>$LOG && mv static/* . &>> &&  rm -rf frontend-master static &>>LOG
STAT_CHECK $?

print " copy Roboshop config\t"
 mv localhost.conf /etc/nginx/default.d/roboshop.conf &>>LOG
STAT_CHECK $?

print "Enabling nginx"
systemctl enable nginx  &>>LOG
STAT_CHECK $?

print "Starting nginx"
systemctl restart nginx &>>LOG
STAT_CHECK $?