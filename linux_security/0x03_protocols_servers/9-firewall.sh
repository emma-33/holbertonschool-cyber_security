#!/bin/bash
iptables -F; iptables -P INPUT DROP
iptables -A INPUT --dport ssh -j ACCEPT; iptables -A INPUT -j DROP