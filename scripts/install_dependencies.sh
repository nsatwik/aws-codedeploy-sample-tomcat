#!/bin/bash
# install_dependencies.sh
echo "Installing Tomcat..."
yum update -y
yum install -y java-11-amazon-corretto
cd /opt
wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.34/bin/apache-tomcat-10.1.34.tar.gz
tar -xvzf apache-tomcat-10.1.34.tar.gz
mv apache-tomcat-10.1.34 /opt/tomcat
chown -R tomcat:tomcat /opt/tomcat
