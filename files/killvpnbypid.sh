#!/bin/bash
export SUDO_ASKPASS='files/askpass.sh'
pid=$(< connect.pid)
if [ $(ps -p "$pid" -o user=) == "$USER" ]
then
	kill -s SIGINT pid "$pid"
	kill -s SIGKILL pid "$pid"
else
	sudo --askpass kill --signal SIGINT pid "$pid"
	sudo --askpass kill --signal SIGINT pid "$pid"
fi
