#!/usr/bin/env bash

set -e

ENV_FILE=/etc/profile.d/env.sh
JDK_VERSION=1.7.0_80
JDK_DOWNLOAD_PATH=http://download.oracle.com/otn-pub/java/jdk/7u80-b15/jdk-7u80-linux-x64.rpm

cp ./hdp-hw.repo /etc/yum.repos.d/

yum install -y \
    less \
    net-tools \
    xterm \
    unzip \
    wget \
    krb5-workstation \
    hadoop-client \
    hbase \
    hive \
    oozie-client \
    zookeeper

wget \
    --progress=dot:giga \
    -O /tmp/jdk-${JDK_VERSION}-x64.rpm \
    --no-check-certificate \
    -c \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    ${JDK_DOWNLOAD_PATH} && \
    yum -y localinstall /tmp/jdk-${JDK_VERSION}-x64.rpm && \
    rm -f /tmp/jdk-${JDK_VERSION}-x64.rpm

cat > ${ENV_FILE} <<EOF
LC_ALL="en_US.UTF-8"
TERM=xterm
JAVA_HOME=/usr/java/default
export LC_ALL TERM JAVA_HOME
EOF
chmod +x ${ENV_FILE}