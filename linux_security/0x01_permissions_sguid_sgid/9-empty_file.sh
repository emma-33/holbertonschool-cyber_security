#!/bin/bash
find "$1" -type f -size 0 -exec chmod -R a=rwx "$1" {} \; 2>/dev/null
