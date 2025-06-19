#!/bin/bash
useradd $1  | semanage login -a -s user_u $1 
