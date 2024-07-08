
echo "******************************************************************************"
echo "Create the database and install the ORDS software." `date`
echo "******************************************************************************"
su - oracle -c 'sh /vagrant/scripts/oracle_create_database.sh'
su - oracle -c 'sh /vagrant/scripts/ords_software_installation.sh'

sh /vagrant/scripts/oracle_service_setup.sh
