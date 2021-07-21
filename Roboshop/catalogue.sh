#!/bin/bash

source common.sh

print "Installing nodeJS\t"
yum  install nodejs make gcc-c++ -y &>>LOG
STAT_CHECK &?




