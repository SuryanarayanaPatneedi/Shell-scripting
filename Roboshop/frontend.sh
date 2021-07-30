#!/bin/bash
LOG=/tmp/roboshop.lg

echo -e "Instaling Nginx\t\t...\t\e[32mdone\e[0m"
yum install nginx -y &>>$LOG
PRINT "Enabling Nginx\t\t"
systemctl enable nginx  &>>$LOG

PRINT "Starting Nginx\t\t"
systemctl restart nginx  &>>$LOG
