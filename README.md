# etokenvpnconnect
Scripts for easy connecting via openconnect with eToken authentication

Install with install.sh

To conntect as NON-ROOT user start with proxyvpnconnect.sh.
In this mode only requests to localhost:3389 are transferred to a specified remote machine.
To start vpn in background and run Remmina use silentproxyrdpconnect.sh

To connect to VPN without proxy ( root needed ) use vpnconnect.sh and/or rdpconnect.sh
Changing network routes is the only reason why root is needed. Enable non-root access to vpnc-script with visudo and openconnect will work without sudo.

Disconnect by disconnect.sh
