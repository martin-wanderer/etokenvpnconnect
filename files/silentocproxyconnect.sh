#!/bin/bash

CERT_ID=$(files/getcertid.sh)
server_address=$(files/getserveraddress.sh 'visual')
ocproxy_script=$(files/getproxyscript.sh)
openconnect --certificate="$CERT_ID" --cafile=$(files/getcafile.sh "$CERT_ID") --script-tun --script "$ocproxy_script" --background --pid-file=connect.pid "$server_address"


