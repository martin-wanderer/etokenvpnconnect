# etokenvpnconnect
Scripts for easy connecting via openconnect with eToken authentication

Install with install.sh
gnu-tls for eToken
openssl for text representation of certificate
openconnect... for vpn connection

Start with connectvpn.sh
Disconnect by disconnect.sh

Use visudo on killvpnbypid.sh to enable disconnect without root password

! token piv value remains in connect.log file. Just disable logging or use from console
