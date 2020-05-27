#Clean up script
echo "Cleaning all the files/directories installed for the Radsec Proxy deployment"

#if exists remove the certs directory
CERTS_DIR=$HOME/certs/

if [ -d "$CERTS_DIR" ] 
then
    sudo rm -fr $CERTS_DIR
fi
echo "..erased all cert related artifacts( $CERTS_DIR )" 



#if exists remove the radsecproxy directory

RADSECPROXY_DIR=$HOME/radsecproxy/

if [ -d "$RADSECPROXY_DIR" ] 
then
    sudo rm -fr $RADSECPROXY_DIR
fi
echo "..erased git downloads ( $RADSECPROXY_DIR )" 


#Purge the installed packages as part of setup
sudo apt-get purge git unzip tree -y
echo "..purged all installed packages( git, tree and unzip )"

echo "Cleaning done"
