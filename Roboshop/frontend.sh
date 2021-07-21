#!/bin/bash

LOG=/tmp/roboshop.log
rm -f $LOG

echo -e "Installing Nginx\t...\t\e[32mDONE\e[0m"
yum install nginx -y  >>$LOG

echo "Enabling Nginx"
systemctl enable nginx

echo "Starting Nginx"
systemctl start nginx