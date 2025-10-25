#!/bin/bash

iptables -t mangle -A OUTPUT -m owner --uid-owner user -j MARK --set-mark 1

iptables -A OUTPUT -m mark --mark 1 -j DROP

TMP_DIR=$(mktemp -d)

PASSWORD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16)

openssl enc -aes-256-cbc -pbkdf2 -in /root/cat.jpg -out "$TMP_DIR/cat.flag" -k "$PASSWORD"

echo "openssl enc -aes-256-cbc -pbkdf2 -in flag -out cat.flag -k $PASSWORD"

echo "The output limit is 66560 chars"

chown user $TMP_DIR

command="import os;os.chdir('$TMP_DIR');import subprocess; print(subprocess.Popen(['pwsh', '-c', input('PS />')], stdout=subprocess.PIPE).stdout.read().decode()[:66560])"

su - user -c "python3 -c \"$command\""

rm -rf "$TMP_DIR"
