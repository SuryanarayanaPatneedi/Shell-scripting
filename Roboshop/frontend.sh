#!/bin/bash

source common.sh

print "Installing Nginx"
yum install nginx -y  >>$LOG
STAT_CHECK $?


print "Enabling Nginx"
systemctl enable nginx >>$LOG
STAT_CHECK $?

print "Starting nginx"
systemctl start nginx >>$LOG
STAT_CHECK $?

