#!/bin/bash

LOG=/tmp/roboshop.lg
rm -f $LOG

echo -e "Instaling Nginx\t\t.."
yum install nginx -y &>>$LOG
if [ $? -eq 0 ] ; then
  echo -e "\e[32m done\e[0m"
else
    echo fail
    fi

echo -e "Enabling Nginx\t\t.."
systemctl enable nginx  &>>$LOG
if [ $? -eq 0 ] ; then
  echo -e "\e[32m done\e[0m"
else
    echo fail
    fi
echo -e   "Starting  Nginx\t\t.."
systemctl start nginx  &>>$LOG
if [ $? -eq 0 ] ; then
  echo -e "\e[32m done\e[0m"
  else
    echo fail
    fi