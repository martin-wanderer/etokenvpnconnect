#!/bin/bash
export SUDO_ASKPASS='files/askpass.sh'
sudo --askpass kill --signal SIGINT $(< connect.pid)
