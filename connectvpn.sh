#!/bin/bash 
export SUDO_ASKPASS='./askpass.sh'

SERVER_ADDRESS=$(zenity --title="Input server address" --width=300 --entry --text="Server:" --entry-text=$(< address.conf))
if [ -n "$SERVER_ADDRESS" ] 
then
  echo $SERVER_ADDRESS > address.conf
fi

CERT_ID=$(< certid.conf)
if [ -z "$CERT_ID" ]
then 
  CERT_ID=$(getcertid.sh)
  echo $CERT_ID > certid.conf
fi

PIN_VALUE=$(zenity --password --title="Input eToken PIN") 

#TODO: generate ca.pem, install gnu-tls, openconnect and driver

sudo --askpass openconnect --certificate=$CERT_ID';pin-value='$PIN_VALUE --cafile=ca.pem --background --pid-file=connect.pid --verbose $SERVER_ADDRESS > connect.log 

