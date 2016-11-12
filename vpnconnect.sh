#!/bin/bash 
export SUDO_ASKPASS='files/askpass.sh'

CERT_ID=$(files/getcertid.sh)
server_address=$(files/getserveraddress.sh 'visual')
PIN_VALUE=$(zenity --password --title="Input eToken PIN")

sudo --askpass openconnect --certificate="$CERT_ID"';pin-value='"$PIN_VALUE" --cafile=$(files/getcafile.sh "$CERT_ID") --background --pid-file=connect.pid "$server_address" > connect.log

