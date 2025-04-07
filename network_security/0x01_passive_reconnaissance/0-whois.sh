#!/bin/bash
whois $1 | grep -e "^Registrant" -e "^Admin" -e "^Tech" | awk 'BEGIN { FS = ": "; OFS = ","} { print $1, $2 }' >> $1.csv
