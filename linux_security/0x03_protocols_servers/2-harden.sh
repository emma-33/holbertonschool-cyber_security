#!/bin/bash
find / -type d -perm -0002 -ls -exec chmod o-w {} \;
