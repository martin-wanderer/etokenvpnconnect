#!/bin/bash

CERT_ID=$(./getcertid.sh)

#TODO: generate remmina conf. logical, easy for use script structure

ocproxy_script=$(./getproxyscript.sh)
remmina --connect="~/.remmina/etokenvpnproxy.remmina" &
openconnect --certificate="$CERT_ID" --cafile=$(./getcafile.sh "$CERT_ID") --script-tun --script "$ocproxy_script" $(./getserveraddress.sh)

