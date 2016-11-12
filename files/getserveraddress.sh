#!/bin/bash
server_address_file="config/server_address.conf"
if [ -f "$server_address_file" ]
then
	SERVER_ADDRESS=$(< "$server_address_file")
fi

if [ "$1" == 'visual' ]
then
	SERVER_ADDRESS=$(zenity --title="Input server address" --width=300 --entry --text="Server:" --entry-text="$SERVER_ADDRESS")
else
	if [ -z "$SERVER_ADDRESS" ] 
	then
		read -p 'Input vpn-server address: ' SERVER_ADDRESS
	fi
fi

if [ -n "$SERVER_ADDRESS" ] 
then
	echo $SERVER_ADDRESS > "$server_address_file"
fi

echo $SERVER_ADDRESS
