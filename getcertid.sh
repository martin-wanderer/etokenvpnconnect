# for each certificate echo it's URL if its purpose is Client Authentication
p11tool --list-all 'pkcs11:model=eToken' | grep -P pkcs11.+id.* -o | while read -r line; do if p11tool --export "$line" | openssl x509 -text | grep --quiet "Client Authentication"; then echo "$line"; fi done
