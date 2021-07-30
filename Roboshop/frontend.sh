#!/bin/bash
LOG=/tmp/roboshop.lg

echo -e "Instaling Nginx\t\t...\t\e[32mdone\e[0m"
yum install nginx -y >$LOG
echo  "Enabling Nginx"
systemctl enable nginx
echo "Starting nginx"
systemctl start nginx ->$LOG