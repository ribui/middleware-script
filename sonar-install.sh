#!/bin/bash

#Author: Edward Ribui
#Date: June 20th 2022

echo "We are installing Sonarqube on CentOS7"


sudo yum update -y
if [ $?=0 ]
then
echo "update successfull"
else
echo "update failed!"
exit 1
fi
sleep 3
sudo yum install java-11-openjdk-devel -y
if [ $?=0 ]
then
echo "java-11 installed successfully"
else
echo "jave-11 failed!"
exit 1
fi
sleep 3
sudo yum install java-11-openjdk -y

sleep 2

cd /opt 

sudo yum install wget -y

sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip

sudo yum install unzip -y

sudo unzip /opt/sonarqube-9.3.0.51899.zip

sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899

cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64

./sonar.sh start

echo "Sonarqube installed and started successfully"