#!/bin/bash

LOG=/tmp/roboshop.log
rm -f $LOG

echo -e "Installing Nginx\t..."
yum install nginx -y  >>$LOG
if [$? -eq 0 ]; then
echo -n -e "\e[32mdone\e[0m"
else
echo fail
f1

echo "Enabling Nginx\t..."
systemctl enable nginx

if [$? -eq 0]; then
  echo -e -n "\e[21mdone\e[0m"
  else
    echo fail
    f1
echo "Starting Nginx"
systemctl start nginx
if [$? -eq 0]; then
  echo -e -n "\e[32mdone\e[0m"
   else
     echo fail
     f1
