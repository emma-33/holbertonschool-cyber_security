#!/bin/bash
sudo nmap -sS --scanflags=TCP -p $2 > custom_scan.txt $1
