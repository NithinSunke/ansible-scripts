#!/bin/bash
. /tmp/scripts/orcl19c/install.env

echo "******************************************************************************"
echo "Install OS Packages." `date`
echo "******************************************************************************"
echo "nameserver 192.168.1.10" >> /etc/resolv.conf

yum install -y yum-utils zip unzip




echo "******************************************************************************"
echo "Firewall." `date`
echo "******************************************************************************"
systemctl stop firewalld
systemctl disable firewalld


echo "******************************************************************************"
echo "SELinux." `date`
echo "******************************************************************************"
sed -i -e "s|SELINUX=enabled|SELINUX=permissive|g" /etc/selinux/config

chown -R oracle.oinstall ${SCRIPTS_DIR} /u01 /u02
