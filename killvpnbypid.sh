#!/bin/bash
export SUDO_ASKPASS='./askpass.sh'
sudo --askpass kill --signal SIGINT $(< connect.pid)
