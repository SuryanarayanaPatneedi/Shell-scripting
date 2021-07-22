#!/bin/bash
source common.sh

print "Installing nodeJS\t"
yum  install nodejs make gcc-c++ -y &>>LOG
STAT_CHECK $?

print "Adding roboshop user\t"
id roboshop &>>LOG
if [$? -ne 0]; then
useradd roboshop &>>LOG
fi
STAT_CHECK $?
#*
print "Download application code"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>LOG
STAT_CHECK $?

print "extract download code"
cd /home/roboshop && unzip -o  /tmp/catalogue.zip &>>LOG && rm -rf catalogue && mv catalogue-main catalogue
STAT_CHECK $?

print "Install NodeJs dependicies"
cd /home/roboshop/catalogue  && npm install --unsafe-perm &>>LOG
STAT_CHECK $?

