#!/bin/bash 
export SUDO_ASKPASS='./askpass.sh'

if [ -f address.conf ]
then
	ENTRY_TEXT=$(< address.conf)
fi
SERVER_ADDRESS=$(zenity --title="Input server address" --width=300 --entry --text="Server:" --entry-text="$ENTRY_TEXT")
if [ -n "$SERVER_ADDRESS" ] 
then
  echo $SERVER_ADDRESS > address.conf
fi

if [ -f certid.conf ]
then
	CERT_ID=$(< certid.conf)
fi
if [ -z "$CERT_ID" ]
then
  CERT_ID=$(./getcertid.sh)
  echo $CERT_ID > certid.conf
fi

CA_FILE='ca.pem'
if [ ! -f "$CA_FILE" ]
then
 ./getcafile.sh "$CERT_ID" > "$CA_FILE"
fi

PIN_VALUE=$(zenity --password --title="Input eToken PIN") 

#TODO: install gnu-tls, openconnect and driver

sudo --askpass openconnect --certificate=$CERT_ID';pin-value='$PIN_VALUE --cafile=ca.pem --background --pid-file=connect.pid --verbose $SERVER_ADDRESS > connect.log 

