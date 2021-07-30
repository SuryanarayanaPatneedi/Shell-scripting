#!/bin/bash

LOG=/tmp/roboshop.lg

echo -e "Instaling Nginx\t\t...\t\e[32mdone\e[0m"
yum install nginx -y &>>$LOG

echo "Enabling Nginx\t\t...\t\e[32mdone\e[0m"
systemctl enable nginx  &>>$LOG

echo "Starting Nginx\t\t...\t\e[32mdone\e[0m"
systemctl start nginx  &>>$LOG
