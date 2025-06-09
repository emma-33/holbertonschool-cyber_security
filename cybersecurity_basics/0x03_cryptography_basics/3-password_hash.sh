#!/bin/bash
(echo -n "$1" | openssl passwd -6) > 3_hash.txt
