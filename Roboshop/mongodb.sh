#!/bin/bash

source common.sh
print "setting up repository\t"
echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
STAT_CHECK $?

print "Install mongodb\t"
yum install -y mongodb-org &>>LOG
STAT_CHECK $?
#asd

print "updating Mongodb listen  Address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
STAT_CHECK $?

print "Start mongodb service"
systemctl enable mongod &>>LOG && systemctl start mongod &>>LOG

print "Downloading mongodb schema "
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"  &>>LOG
STAT_CHECK $?

print "Load mongodb schema"
cd /tmp && -o  unzip mongodb.zip && cd mongodb-main  && mongo < catalogue.js && mongo < users.js
