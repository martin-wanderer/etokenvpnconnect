#!/bin/bash
if [ -f address.conf ]
then
	ENTRY_TEXT=$(< address.conf)
fi
SERVER_ADDRESS=$(zenity --title="Input server address" --width=300 --entry --text="Server:" --entry-text="$ENTRY_TEXT")
if [ -n "$SERVER_ADDRESS" ] 
then
  echo $SERVER_ADDRESS > address.conf
  echo $SERVER_ADDRESS
fi
