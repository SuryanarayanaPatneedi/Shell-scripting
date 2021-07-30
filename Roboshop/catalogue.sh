#!/bin/bash
source common.sh

 PRINT "Install NodeJS\t\t"
  yum install nodejs make gcc-c++ -y &>>$LOG
  STAT_CHECK $?
PRINT "Add RoboShop Application User"
  id roboshop &>>$LOG
  if [ $? -ne 0 ]; then
    useradd roboshop &>>$LOG
  fi
  STAT_CHECK $?
  PRINT "Download application code"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>LOG
STAT_CHECK $?
PRINT "Extract Downloaded code"
cd /home/roboshop  && unzip -o  /tmp/catalogue.zip &>>LOG  &&  rm -rf catalogue && &>>LOG mv catalogue-main catalogue
STAT_CHECK $?

PRINT "Installing nodejs dependencies"
cd /home/roboshop/catalogue && npm install --unsafe-perm &>>LOG
STAT_CHECK $?

# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue