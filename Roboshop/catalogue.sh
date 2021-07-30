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

PRINT "FIX application permissions"
chown roboshop:roboshop /home/roboshop -R &>>LOG
STAT_CHECK $?
PRINT "Update Systemd file"
sed   -i -e "s/MONGO_DNSNAME/mongodb.roboshop.internal/" /home/roboshop/catalogue/systemd.service &&  mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
STAT_CHECK $?
PRINT "Start catalogue service"
systemctl daemon-reload  &>>LOG && systemctl start catalogue  &>>LOG &&  systemctl enable catalogue &>>LOG
STAT_CHECK $?