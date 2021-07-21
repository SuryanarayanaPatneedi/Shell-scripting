#!/bin/bash


echo "Installing Nginx"
yum install nginx -y

echo "Enabling Nginx"
systemctl enable nginx

Echo "Starting Nginx"
systemctl start nginx