#!/bin/bash
#TODO: read all values via zenity if 'visual'. 
ocproxy_conf_file="config/ocproxy.conf"
if [ -f "$ocproxy_conf_file" ]
then
	remote_host=$(< "$ocproxy_conf_file")
fi
if [ -z "$remote_host" ]
then
	read -p 'Input remote desktop address: ' remote_host
	echo "$remote_host" > "$ocproxy_conf_file"
	files/setremminasettings.sh "$remote_host"
fi

echo 'ocproxy -D 11080 -L 3389:'"$remote_host"':3389'


