#!/bin/bash
if [ -f address.conf ]
then
	SERVER_ADDRESS=$(< address.conf)
fi

if [ -z "$SERVER_ADDRESS" ] 
then
	read -p 'Input vpn-server address: ' SERVER_ADDRESS
	echo $SERVER_ADDRESS > address.conf
fi

echo $SERVER_ADDRESS
