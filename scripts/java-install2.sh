#!/bin/bash

set -e

CONTAINER_ID=$1
blueprint=$2
version=$3

set +e 
 java=$(sudo docker exec -it $CONTAINER_ID which java)
set -e

if [[ -z $java ]]; then
sudo docker exec -it $CONTAINER_ID mkdir opt/jdk
if [[ ! -d ~/$blueprint/libs ]]; then
    mkdir ~/$blueprint/libs
fi
if [[ $version = '8' ]]; then
    if [[ ! -f ~/.TDWF/libs/jdk-8u5-linux-x64.tar.gz ]]; then
       ctx logger info "download java JVM"
       wget -O ~/.TDWF/libs/jdk-8u5-linux-x64.tar.gz --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u5-b13/jdk-8u5-linux-x64.tar.gz
    fi
    cp ~/.TDWF/libs/jdk-8u5-linux-x64.tar.gz ~/$blueprint/libs/jdk-8u5-linux-x64.tar.gz
    sudo docker exec -it $CONTAINER_ID tar -zxf root/$blueprint/libs/jdk-8u5-linux-x64.tar.gz -C /opt/jdk
    sudo docker exec -it $CONTAINER_ID update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_05/bin/java 100
    sudo docker exec -it $CONTAINER_ID update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_05/bin/javac 100
else if [[ $version = '7' ]]; then
        if [[ ! -f ~/.TDWF/libs/jdk-7u79-linux-x64.tar.gz ]]; then
           wget -O ~/.TDWF/libs/jdk-7u79-linux-x64.tar.gz --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz"
        fi
        cp ~/.TDWF/libs/jdk-7u79-linux-x64.tar.gz ~/$blueprint/libs/jdk-7u79-linux-x64.tar.gz
        sudo docker exec -it $CONTAINER_ID tar xzf jdk-7u79-linux-x64.tar.gz -C /opt/jdk
        sudo docker exec -it $CONTAINER_ID update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.7.0_79/bin/java 100
        sudo docker exec -it $CONTAINER_ID update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.7.0_79/bin/javac 100
     fi
fi

fi  
