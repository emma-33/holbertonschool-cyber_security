#!/bin/bash
whois $1 | grep -e "^Registrant" -e "^Admin" -e "^Tech" >> $1.csv 
