#!/bin/bash
ocproxy_conf_file="ocproxy.conf"
if [ -f "$ocproxy_conf_file" ]
then
	ocproxy_conf=$(< "$ocproxy_conf_file")
fi
if [ -z "$ocproxy_conf" ]
then
	read -p 'Input remote desktop address: ' remote_host
	ocproxy_conf='ocproxy -D 11080 -L 3389:'"$remote_host"':3389'
	# copy remmina if not exists
	echo "$ocproxy_conf" > "$ocproxy_conf_file"
fi
echo "$ocproxy_conf"


