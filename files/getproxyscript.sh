#!/bin/bash
ocproxy_conf_file="config/ocproxy.conf"
if [ -f "$ocproxy_conf_file" ]
then
	remote_host=$(< "$ocproxy_conf_file")
fi
if [ -z "$remote_host" ]
then
	read -p 'Input remote desktop address: ' remote_host
	echo "$remote_host" > "$ocproxy_conf_file"
fi
# RDP settings. Hehe, 'cause remmina also may need remote address
# TODO: move to its own script?
filename="etokenvpnproxy.remmina"
source_file="files/""$filename"
dest_file="$HOME/.remmina/""$filename"
if [ ! -f "$dest_file" ]
then
	cp "$source_file" "$dest_file"
fi
echo 'ocproxy -D 11080 -L 3389:'"$remote_host"':3389'


