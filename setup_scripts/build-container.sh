echo "Creating the Container"
sudo docker volume create radsecproxy-vol

#create the container
sudo docker create \
    -p $AUTH_PORT:1812/udp -p $ACCOUNTING_PORT:1813/udp 
    -v radsecproxy-vol:/var/log \
    --name $RADSECPROXY_SERVER_NAME \
    --restart always \
    cloudteamrahi48303/radsecproxy:latest

echo "Coping key,certificates and config files to the Container"

#Copy the key ,Certificates  and the radsecproxy config file
sudo docker cp $RADSEC_KEY_FILE $RADSECPROXY_SERVER_NAME:/etc/ssl/certs/radsec.key.pem
sudo docker cp $RADSEC_CRT_FILE $RADSECPROXY_SERVER_NAME:/etc/ssl/certs/radsec.crt.pem
sudo docker cp $CA_CERT_FILE $RADSECPROXY_SERVER_NAME:/etc/ssl/certs/cacert.pem
sudo docker cp $RADSEC_CONFIG_FILE $RADSECPROXY_SERVER_NAME:/usr/local/etc/radsecproxy.conf

echo "copy completed!"

echo "Starting the Radsecproxy Container"
#Start the Container 
sudo docker start $RADSECPROXY_SERVER_NAME

#Wait for 3 secs to start the container to get the complete logs
sleep 3  # Waits 3 seconds.


#display the logs of the container
echo "RadsecProxy Server Log:"
sudo docker logs $RADSECPROXY_SERVER_NAME

