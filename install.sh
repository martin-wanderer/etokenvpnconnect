#!/bin/bash
sudo apt install gnutls-bin # for eToken integration
sudo mkdir /etc/pkcs11
sudo mkdir /etc/pkcs11/modules
sudo echo 'module: /usr/lib/libeTPkcs11.so' > /etc/pkcs11/modules/eToken.module # path to eToken driver
sudo apt install openssl # for certificate text representation 
sudo apt install openconnect # well, for vpn
sudo apt install ocproxy # to run openconnect as non-root
