#!/bin/bash

# install jdk
JDK_NAME="jdk-8u161-linux-x64.rpm"
JDK_ROOT="http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808"
JDK_URL="$JDK_ROOT/$JDK_NAME"
wget --no-cookies --no-check-certificate \
     --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "$JDK_URL"

sudo yum -y localinstall $JDK_NAME
rm $JDK_NAME
