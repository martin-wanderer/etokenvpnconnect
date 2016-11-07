#!/bin/bash
export SUDO_ASKPASS='./askpass.sh'
sudo --askpass ./killvpnbypid.sh
