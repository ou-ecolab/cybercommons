#!/bin/bash
if [ -z "$NOTIFY_EMAIL" ];
  then 
   echo "NOTIFY_EMAIL must be set for acme in secrets.env"
   exit 0
fi 

if [ ! -d /etc/letsencrypt/renewal ];
#if true; #for testing uncomment this line and comment the previous line 
    then
    echo "trying to obtain certificate"	  
    certbot certonly --webroot -w /data/letsencrypt --agree-tos --email $NOTIFY_EMAIL --server https://acme.sectigo.com/v2/InCommonRSAOV --eab-kid "$EAB_KID" --eab-hmac-key "$EAB_HMAC_KEY" --domain $NGINX_HOST --cert-name $NGINX_HOST
else
    certbot renew --noninteractive --quiet
fi

