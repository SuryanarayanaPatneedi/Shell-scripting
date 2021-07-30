#!/bin/bash

LOG=/tmp/roboshop.lg
rm -f $LOG

echo -e "Instaling Nginx\t\t.."
yum install nginx -y &>>$LOG
if [ $? -eq 0 ] ; then
  echo -e "\e[32m done\e[0m"
else
    echo -e "\e[32m fail"
    fi

echo -e "Enabling Nginx\t\t.."
systemctl enable nginx  &>>$LOG
if [ $? -eq 0 ] ; then
  echo -e "\e[32m done\e[0m"
else
    echo -e "\e[32m fail\e[0m"
    fi
echo -e   "Starting  Nginx\t\t.."
systemctl restart nginx  &>>$LOG
if [ $? -eq 0 ] ; then
  echo -e "\e[32m done\e[0m"
  else
    echo -e "\e[32m fail\e[0m"
    fi