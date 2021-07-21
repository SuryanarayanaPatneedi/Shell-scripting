#!/bin/bash
source common.sh

print "Installing nodeJS\t"
yum  install nodejs make gcc-c++ -y &>>LOG
STAT_CHECK $?

print "Adding roboshop user\t"
id roboshop &>>
if [$? -ne 0]; then
useradd roboshop &>>LOG
fi
STAT_CHECK $?

print "Download application code"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>LOG
STAT_CHECK $?

Print "extract download code"
cd /home/roboshop &>>LOG && unzip /tmp/catalogue.zip &>>LOG && mv catalogue-main catalogue &>>LOG && cd /home/roboshop/catalogue &>>LOG && npm install >>LOG

