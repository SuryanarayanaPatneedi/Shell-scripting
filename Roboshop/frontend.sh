#!/bin/bash


echo -e "Installing Nginx\t...\t\e[32mDONE\e[om"
yum install nginx -y

echo "Enabling Nginx"
systemctl enable nginx

echo "Starting Nginx"
systemctl start nginx