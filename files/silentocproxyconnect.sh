#!/bin/bash

CERT_ID=$(files/getcertid.sh)
server_address=$(files/getserveraddress.sh 'visual')
ocproxy_script=$(files/getproxyscript.sh)
PIN_VALUE=$(zenity --password --title="Input eToken PIN")
openconnect --certificate="$CERT_ID"';pin-value='"$PIN_VALUE" --cafile=$(files/getcafile.sh "$CERT_ID") --script-tun --script "$ocproxy_script" --background --pid-file=connect.pid "$server_address"


