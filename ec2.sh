#!/bin/bash

yum update -y # To update instance 
yum install git -y # To install git
amazon-linux-extras install docker # To install docker
service docker start # To start docker
usermod -a -G docker ec2-user # To add EC2 user to the docker group
yum install -y httpd.x86_64 # To install apache server
systemctl start httpd.service # To start apache server
systemctl enable httpd.service # To enalbe server persistence across sessions
