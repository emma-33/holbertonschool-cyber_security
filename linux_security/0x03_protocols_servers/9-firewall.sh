#!/bin/bash
iptables -F; iptables -P INPUT DROP
iptables -A INPUT --dport ssh -p tcp -j ACCEPT; iptables -A INPUT -j DROP