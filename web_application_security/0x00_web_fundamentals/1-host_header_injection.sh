#!/bin/bash
curl -H "Host: $1" -d "email=$3" -X POST "$2"
