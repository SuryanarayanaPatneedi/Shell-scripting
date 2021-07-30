#!/bin/bash


USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
  echo -e "\e[31mYou should be root user / sudo user to run this script\e[0m"
  exit 2
fi


LOG=/tmp/roboshop.lg
rm -f $LOG

STAT_CHECK(){
  if [ $1 -eq 0 ] ; then
  echo -e "\e[32m done\e[0m"
else
    echo -e "\e[32m fail\e[0m"
    exit 1
    fi
}
PRINT() {
  echo -e "\n###########################\t$1\t###########################" &>>$LOG
  echo -n -e "$1\t\t..."
}

SETUP_SYSTEMD() {
  PRINT "Setup SystemD file\t"
  sed -i -e "s/MONGO_DNSNAME/mongodb.roboshop.internal/" -e "s/REDIS_ENDPOINT/redis.roboshop.internal/" -e "s/MONGO_ENDPOINT/mongodb.roboshop.internal/" -e "s/CATALOGUE_ENDPOINT/catalogue.roboshop.internal/" -e 's/CARTENDPOINT/cart.roboshop.internal/' -e 's/DBHOST/mysql.roboshop.internal/' -e 's/CARTHOST/cart.roboshop.internal/' -e 's/USERHOST/user.roboshop.internal/' -e 's/AMQPHOST/rabbitmq.roboshop.internal/'  /home/roboshop/${COMPONENT}/systemd.service && mv /home/roboshop/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service
  STAT_CHECK $?

  PRINT "Start ${COMPONENT} Service\t"
  systemctl daemon-reload &>>$LOG && systemctl restart ${COMPONENT} &>>$LOG && systemctl enable ${COMPONENT} &>>$LOG
  STAT_CHECK $?
}

NODEJS() {
  PRINT "Install NodeJS\t\t"
  yum install nodejs make gcc-c++ -y &>>$LOG
  STAT_CHECK $?

  ADD_APPLICATION_USER
  DOWNLOAD_APP_CODE

  PRINT "Install NodeJS Dependencies"
  cd /home/roboshop/${COMPONENT} && npm install --unsafe-perm &>>$LOG
  STAT_CHECK $?

  PERM_FIX
  SETUP_SYSTEMD
}

