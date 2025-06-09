#!/bin/bash
(echo -n "$1" | openssl passwd -6 rand 16) > 3_hash.txt
