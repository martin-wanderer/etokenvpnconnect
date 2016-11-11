#!/bin/bash
CA_FILE='ca.pem'
if [ ! -f "$CA_FILE" ]
then
	CERT_ID="$1"
	ISSUER=$(p11tool --export "$CERT_ID" | openssl x509 -text | grep -P 'Issuer:.*' )

	p11tool --list-all 'pkcs11:model=eToken' | grep -P pkcs11.+id.* -o |
	while read -r line; do
		CERT_TEXT=$(p11tool --export "$line" | openssl x509 -text)
		if echo "$CERT_TEXT" | grep --quiet "CA:TRUE" && echo "$CERT_TEXT" | grep --quiet "$ISSUER";
		then
			p11tool --export "$line" > "$CA_FILE";	
		fi
	done
fi
echo "$CA_FILE"
