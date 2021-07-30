#!/bin/bash

PRINT "Installing Nginx"
yum install nginx -y &>>$LOG
STATUS_CHECK $?

PRINT "Enabling Nginx"
systemctl enable nginx  &>>$LOG
STATUS_CHECK $?
PRINT   "Starting  Nginx"

systemctl restart nginx  &>>$LOG
STATUS_CHECK $?
