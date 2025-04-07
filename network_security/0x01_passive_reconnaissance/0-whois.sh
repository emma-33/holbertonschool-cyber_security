#!/bin/bash
whois $1 | grep -e "^Registrant" -e "^Admin" -e "^Tech" >> holbertonschool.com.csv 
