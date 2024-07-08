#!/bin/bash
. /tmp/scripts/orcl19c/install.env

echo "setting hostname"
echo "======================================"
hostnamectl set-hostname ${HOSTNAME}

yum install -y oracle-database-preinstall-19c
echo -e "${ORACLE_PASSWORD}\n${ORACLE_PASSWORD}" | passwd oracle

echo "******************************************************************************"
echo "Set root and oracle password and change ownership of /u01." `date`
echo "******************************************************************************"
echo -e "${ROOT_PASSWORD}\n${ROOT_PASSWORD}" | passwd


mkdir -p ${SOFTWARE_DIR}
mkdir -p ${DATA_DIR}