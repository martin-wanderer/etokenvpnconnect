#!/bin/bash
sudo apt install gnutls-bin
sudo mkdir /etc/pkcs11
sudo mkdir /etc/pkcs11/modules
sudo echo 'module: /usr/lib/libeTPkcs11.so' > /etc/pkcs11/modules/eToken.module
sudo apt install openssl
sudo apt install openconnect
