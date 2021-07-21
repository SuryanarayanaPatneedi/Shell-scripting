#!/bin/bash

LOG=/tmp/roboshop.log
rm -f $LOG

echo -e  -n "Installing Nginx\t..."
yum install nginx -y  >>$LOG
if [$? -eq 0 ]; then
  echo  -e "\e[32m done\e[0m"
else
  echo fail
fi

echo  -e -n "Enabling Nginx\t\t\t..."
systemctl enable nginx >>$LOG
if [$? -eq 0]; then
  echo -e  "\e[32m done\e[0m"
else
    echo fail
    fi
echo -e -n "Starting Nginx\t\t\t..."
systemctl start nginx >>$LOG
if [$? -eq 0]; then
  echo -e -n "\e[32m done\e[0m"
else
     echo fail
fi
