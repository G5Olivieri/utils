#!/usr/bin/env bash

set -eou pipefail

script_dir=$(dirname $(readlink -f $0))
key_path="$script_dir/key.pem"
certificate_path="$script_dir/certificate.pem"
subj="/C=BR/ST=São Paulo/L=São Paulo/O=Glayson Org/CN=glayson.org/emailAddress=glayson@email.org/OU=Information Technology"

openssl req -newkey rsa:2048 -nodes -keyout "$key_path" \
  -x509 -days 365 -out "$certificate_path" \
  -subj "$subj"

openssl x509 -text -noout -in $certificate_path

echo 'Generated files'
echo "$key_path"
echo "$certificate_path"
