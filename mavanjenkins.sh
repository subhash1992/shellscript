!#/bin/bash

wget https://pkg.jenkins.io/redhat-stable/jenkins-2.176.1-1.1.noarch.rpm

rpm -ivh jenkins-2.176.1-1.1.noarch.rpm
 
service jenkins start

cd/opt
 
wget http://mirrors.estointernet.in/apache/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.zip

unzip apache-maven-3.6.1-bin.zip

mv apache-maven-3.6.1 maven

sed -i '/PATH=$PATH:$HOME\/bin/i PATH=$MAVEN_HOME\/bin' ~/.bash_profile

sed -i '/PATH=$MAVEN_HOME\/bin/i MAVEN_HOME=\/opt\/maven' ~/.bash_profile

source ~/.bash_profile
