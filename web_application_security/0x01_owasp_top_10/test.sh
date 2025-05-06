#!/bin/bash

encoded_string="$1"

# Remove {xor} prefix and decode base64
base64_string=$(echo "$encoded_string" | sed 's/{xor}//')

decoded_base64=$(echo "$base64_string" | base64 -d)

# Extract the password hash from the decoded base64 string
password_hash=$(echo "$decoded_base64" | grep -oP "(?<=password_hash': ')[^']+")

# Decode the password hash
decoded_password_hash=$(echo "$password_hash" | base64 -d)

# Try all possible XOR keys (0-255) to decode the password hash
for key in {0..255}; do
    decoded=$(echo "$decoded_password_hash" | python3 -c "
import sys
key = $key
decoded = ''.join(chr(b ^ key) for b in sys.stdin.buffer.read())
print(decoded)
")
    echo "Key $key: $decoded"
done



#!/bin/bash

# Check if the argument is provided
if [ -z "$1" ]; then
  echo "Usage: ./1-xor_decoder.sh {xor}encoded_string"
  exit 1
fi

input="$1"
# Remove the {xor} prefix
encoded=${input:5}

# Base64 decode the input
decoded=$(echo "$encoded" | base64 -d 2>/dev/null)

# Check if base64 decoding succeeded
if [ $? -ne 0 ]; then
  echo "Error: Invalid Base64 input."
  exit 1
fi

# Define XOR key (you can modify this based on the actual key)
key=95

# Perform XOR decoding by looping through each character
decoded_message=""
for (( i=0; i<${#decoded}; i++ )); do
    char=$(printf "%d" "'${decoded:$i:1}")  # Get ASCII value of each char
    xor_char=$(($char ^ $key))              # XOR with the key
    decoded_message+=$(printf \\$(printf '%03o' "$xor_char"))  # Convert back to character
done

# Output the decoded message
echo "$decoded_message"