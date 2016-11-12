#!/bin/bash
#TODO: logical, easy for use script structure

CERT_ID=$(./getcertid.sh)
server_address=$(./getserveraddress.sh)
ocproxy_script=$(./getproxyscript.sh)

openconnect --certificate="$CERT_ID" --cafile=$(./getcafile.sh "$CERT_ID") --script-tun --script "$ocproxy_script" --pid-file=connect.pid "$server_address"

remmina

