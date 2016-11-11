# for each certificate echo URL if its purpose is Client Authentication
CERT_ID_FILE="certid.conf"
if [ -f "$CERT_ID_FILE" ]
then
	CERT_ID=$(< "$CERT_ID_FILE")
fi

if [ -z "$CERT_ID" ]
then
	p11tool --list-all 'pkcs11:model=eToken' | grep -P pkcs11.+id.* -o |
	while read -r line; do
		if p11tool --export "$line" | openssl x509 -text | grep --quiet "Client Authentication"
		then
			echo "$line" > "$CERT_ID_FILE"
		fi
	done
fi
echo $(< "$CERT_ID_FILE")


