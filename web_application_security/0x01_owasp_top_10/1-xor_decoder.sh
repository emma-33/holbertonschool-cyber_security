#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: ./1-xor_decoder.sh {xor}encoded_message"
    exit 1
fi

encoded_mess="$1"

no_xor_encoded_mess=${encoded_mess:5}

Base64_mess=$(echo "$no_xor_encoded_mess" | base64 -d | tr -d '\0')

key=95

decoded_message=""
for (( i=0; i<${#Base64_mess}; i++ )); do
    char="${Base64_mess:i:1}" 
    ascii_value=$(printf "%d" "'$char")
    xor_char=$(($ascii_value ^ $key))
    decoded_mess+=$(printf \\$(printf '%03o' "$xor_char"))
done

echo "$decoded_mess"
