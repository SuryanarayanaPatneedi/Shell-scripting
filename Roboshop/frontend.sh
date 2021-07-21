#!/bin/bash

LOG=/tmp/roboshop.log
rm -f $LOG

echo -e "Installing Nginx\t..."
yum install nginx -y  >>$LOG
if [$? -eq 0 ]; then
  echo -n -e "\e[32m done\e[0m"
else
  echo fail
fi

echo "Enabling Nginx\t..."
systemctl enable nginx

if [$? -eq 0]; then
  echo -e -n "\e[32m done\e[0m"
else
    echo fail
    fi
echo "Starting Nginx"
systemctl start nginx
if [$? -eq 0]; then
  echo -e -n "\e[32m done\e[0m"
else
     echo fail
fi
