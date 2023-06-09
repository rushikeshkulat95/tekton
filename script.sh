#!/bin/bash
  
sudo apt update -y
sudo apt install openjdk-17-jdk-headless -y
sudo apt install openjdk-17-jre-headless -y

sudo apt install unzip

sudo wget -P /opt https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-10.0.0.68432.zip

sleep 5s

sudo unzip /opt/sonarqube-10.0.0.68432.zip -d /opt/

sleep 2m

sudo chown adminuser:adminuser /opt/sonarqube-10.0.0.68432 -R
export SONAR_JAVA_PATH="/usr/lib/jvm/java-17-openjdk-amd64/bin/java"
sh /opt/sonarqube-10.0.0.68432/bin/linux-x86-64/sonar.sh start

sleep 2m                

sudo chown adminuser:adminuser /opt/sonarqube-10.0.0.68432 -R
export SONAR_JAVA_PATH="/usr/lib/jvm/java-17-openjdk-amd64/bin/java"
sh /opt/sonarqube-10.0.0.68432/bin/linux-x86-64/sonar.sh start