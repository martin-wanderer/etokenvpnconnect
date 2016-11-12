#!/bin/bash
#TODO: read all values via zenity if 'visual'.
filename="etokenvpnproxy.remmina"
source_file="files/$filename"
remmina_home="$HOME/.remmina/"
dest_file="$remmina_home""$filename"
if [ ! -f "$dest_file" ]
then
	cp "$source_file" "$dest_file" # --no-clobber
	echo "name=etokenvpnproxy" >> "$dest_file"

	read -p 'Input RDP username: ' username
	echo "username=$username" >> "$dest_file"

	read -p 'Input RDP user domain: ' domain
	echo "domain=$domain" >> "$dest_file"
fi

remote_host="$1"
dest_file="$remmina_home""etokenvpn.remmina"
if [ ! -f "$dest_file" ]
then
	cp "$source_file" "$dest_file" # --no-clobber
	echo "name=etokenvpn" >> "$dest_file"

	echo "server=$remote_host" >> "$dest_file"

	read -p 'Input RDP username: ' username
	echo "username=$username" >> "$dest_file"

	read -p 'Input RDP user domain: ' domain
	echo "domain=$domain" >> "$dest_file"
fi


