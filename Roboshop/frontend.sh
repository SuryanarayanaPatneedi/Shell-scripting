#!/bin/bash

source common.sh

PRINT "Installing Nginx"
yum install nginx -y &>>$LOG
STAT_CHECK $?

PRINT "Downloading frontend"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>LOG
STAT_CHECK $?
PRINT "Removing oldtx"
cd /usr/share/nginx/html  &>>$LOG &&   rm -rf * &>>$LOG
STAT_CHECK $?
PRINT "Extract"
unzip /tmp/frontend.zip  &>>$LOG &&  mv frontend-main/* . &>>$LOG && mv static/* . &>>$LOG &&  rm -rf frontend-master static &>>$LOG
STATU_CHECK $?
PRINT "copy roboshop config"
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>>LOG
STAT_CHECK $?
PRINT "Update RoboShop Config\t"
sed -i -e '/catalogue/ s/localhost/catalogue.roboshop.internal/' -e '/user/ s/localhost/user.roboshop.internal/'  -e '/cart/ s/localhost/cart.roboshop.internal/' -e '/shipping/ s/localhost/shipping.roboshop.internal/' -e '/payment/ s/localhost/payment.roboshop.internal/' /etc/nginx/default.d/roboshop.conf
STAT_CHECK $?

PRINT "Enabling Nginx"
systemctl enable nginx  &>>$LOG
STAT_CHECK $?
PRINT   "Starting  Nginx"

systemctl restart nginx  &>>$LOG
STAT_CHECK $?
