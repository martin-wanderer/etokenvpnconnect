#!/bin/bash

CERT_ID=$(./getcertid.sh)

#TODO: logical, easy for use script structure

openconnect --certificate="$CERT_ID" --cafile=$(./getcafile.sh "$CERT_ID") --script-tun --script "ocproxy -D 11080 -L 3389:10.133.1.112:3389" $(./getserveraddress.sh)

