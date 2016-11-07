#!/bin/bash 
export SUDO_ASKPASS='./askpass.sh' 
SERVER_ADDRESS=$(zenity --title="Input server address" --width=300 --entry --text="Server:" --entry-text=$(< connect.conf)) 
if [ -n "$SERVER_ADDRESS" ] 
then 
  echo $SERVER_ADDRESS > connect.conf 
fi 
PIN_VALUE=$(zenity --password --title="Input eToken PIN") 
#TODO: find id by Client Authentication string, generate ca.pem, rename ca.pem, install gnu-tls, openconnect and driver 
sudo --askpass openconnect --certificate='pkcs11:model=eToken;id=%0d%91;pin-value='$PIN_VALUE --cafile=ca.pem --background --pid-file=connect.pid --verbose $SERVER_ADDRESS > connect.log 

