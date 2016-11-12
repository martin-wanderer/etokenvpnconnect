#!/bin/bash

CERT_ID=$(files/getcertid.sh)
server_address=$(files/getserveraddress.sh)
ocproxy_script=$(files/getproxyscript.sh)
openconnect --certificate="$CERT_ID" --cafile=$(files/getcafile.sh "$CERT_ID") --script-tun --script "$ocproxy_script" "$server_address"


