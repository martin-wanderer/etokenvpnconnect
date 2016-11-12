#!/bin/bash
export SUDO_ASKPASS='files/askpass.sh'
if [ "$1" == 'no-root' ]
then
	kill --signal SIGINT $(< connect.pid)
else
	sudo --askpass kill --signal SIGINT $(< connect.pid)
fi
