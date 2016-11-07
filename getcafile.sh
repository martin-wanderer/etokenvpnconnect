# for each certificate extract its text if it is a CA cert
#TODO: echo each cert to corresponding file
# find rigth CA cert by client cert issuer
p11tool --list-all 'pkcs11:model=eToken' | grep -P pkcs11.+id.* -o | while read -r line; do if p11tool --export "$line" | openssl x509 -text | grep --quiet "CA:TRUE"; then p11tool --export "$line"; fi done
