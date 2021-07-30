#!/bin/bash
LOG=/tmp/roboshop.lg
rm -f $LOG

echo -e "Installing Nginx\t\t.."
yum installl nginx -y &>>$LOG
if [ $? -eq 0 ] ; then
  echo -e "\e[32m done\e[0m"
else
    echo -e "\e[32m fail"
    exit 1
    fi

echo -e "Enabling Nginx\t\t.."
systemctl enable nginx  &>>$LOG
if [ $? -eq 0 ] ; then
  echo -e "\e[32m done\e[0m"
else
    echo -e "\e[32m fail\e[0m"
    exit 1
    fi
echo -e   "Starting  Nginx\t\t.."

systemctl restart nginx  &>>$LOG
if [ $? -eq 0 ] ; then
  echo -e "\e[32m done\e[0m"
  else
    echo -e "\e[32m fail\e[0m"
    exit 1
    fi
