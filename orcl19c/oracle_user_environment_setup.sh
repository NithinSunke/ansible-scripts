#!/bin/bash
. /tmp/scripts/orcl19c/install.env

mkdir -p ${SCRIPTS_DIR}

echo "******************************************************************************"
echo "Create environment script." `date`
echo "******************************************************************************"
cat > ${SCRIPTS_DIR}/profile_${ORACLE_SID}.sh <<EOF
# Regular settings.
export TMP=/tmp
export TMPDIR=\$TMP

export ORACLE_HOSTNAME=`hostname`
export ORACLE_UNQNAME=${ORACLE_UNQNAME}
export ORACLE_BASE=${ORACLE_BASE}
export ORACLE_HOME=${ORACLE_BASE}/${ORACLE_HOME_EXT}
export ORACLE_SID=${ORACLE_SID} 

export PATH=/usr/sbin:/usr/local/bin:\$PATH
export PATH=${ORACLE_HOME}/bin:\$PATH

export LD_LIBRARY_PATH=\$ORACLE_HOME/lib:/lib:/usr/lib
export CLASSPATH=\$ORACLE_HOME/jlib:\$ORACLE_HOME/rdbms/jlib

export ORA_INVENTORY=${ORA_INVENTORY}

EOF


echo "******************************************************************************"
echo "Add it to the .bash_profile." `date`
echo "******************************************************************************"
echo ". ${SCRIPTS_DIR}/profile_${ORACLE_SID}.sh" >> /home/oracle/.bash_profile


echo "******************************************************************************"
echo "Create start/stop scripts." `date`
echo "******************************************************************************"
. ${SCRIPTS_DIR}/profile_${ORACLE_SID}.sh

cat > ${SCRIPTS_DIR}/start_all.sh <<EOF
#!/bin/bash
. ${SCRIPTS_DIR}/profile_${ORACLE_SID}.sh

export ORAENV_ASK=NO
. oraenv
export ORAENV_ASK=YES

dbstart \$ORACLE_HOME
EOF


cat > ${SCRIPTS_DIR}/stop_all.sh <<EOF
#!/bin/bash
. ${SCRIPTS_DIR}/profile_${ORACLE_SID}.sh

export ORAENV_ASK=NO
. oraenv
export ORAENV_ASK=YES

dbshut \$ORACLE_HOME
EOF


chown -R oracle.oinstall ${SCRIPTS_DIR}
chmod u+x ${SCRIPTS_DIR}/*.sh
