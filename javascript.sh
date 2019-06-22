!#/bin/bash

yum -y install updates
wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie"   "http://download.oracle.com/otn-pub/java/jdk/11.0.2+9/f51449fcd52f4d52b93a989c5c56ed3c/jdk-11.0.2_linux-x64_bin.rpm"
rpm -Uvh jdk-11.0.2_linux-x64_bin.rpm

if [  $(java -version 2>&1 >/dev/null | grep 'java version' | awk '{print $3}') != "11.0.2" ]
then
   alternatives --config java <<< '2'
else
   java is already configured correctly
fi

sed -i '/PATH=$PATH:$HOME\/bin/i PATH=$PATH:\/usr\/java\/jdk-11.0.2\/bin' ~/.bash_profile

sed -i '/PATH=$PATH:\/usr\/java\/jdk-11.0.2\/bin/i JAVA_HOME=\/usr\/java\/jdk-11.0.2' ~/.bash_profile

source ~/.bash_profile
