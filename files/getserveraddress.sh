#!/bin/bash
server_address_file="config/server_address.conf"
if [ -f "$server_address_file" ]
then
	SERVER_ADDRESS=$(< "$server_address_file")
fi

if [ -z "$SERVER_ADDRESS" ] 
then
	read -p 'Input vpn-server address: ' SERVER_ADDRESS
	echo $SERVER_ADDRESS > "$server_address_file"
fi

echo $SERVER_ADDRESS
