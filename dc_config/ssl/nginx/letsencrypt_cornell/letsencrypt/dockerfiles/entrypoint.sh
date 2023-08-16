#!/bin/bash
if [ -z "$NOTIFY_EMAIL" ];
  then 
   echo "NOTIFY_EMAIL must be set for letsencrypt in secrets.env"
   exit 0
fi 

if [ ! -d /etc/letsencrypt/renewal ];
  then
    #certbot certonly --webroot -w /data/letsencrypt --email $NOTIFY_EMAIL --agree-tos --no-eff-email -d $NGINX_HOST
    certbot certonly --standalone --non-interactive --agree-tos --email ecopad@cornell.edu --server https://acme.sectigo.com/v2/InCommonRSAOV --eab-kid 7EnLHwqq1ePNfca4Ipqj_w --eab-hmac-key XerHVp_THwAPxCUbz49bF7jv1UhKmG2Ns3Xu9eIGm0g8MOo6-mqln0X2MaVk658Q2Zj1HJtCnyB9Ev4__z9THQ --domain ecopad.cals.cornell.edu --cert-name ecopad
else
    certbot renew --noninteractive --quiet
fi

