#!/bin/bash

scp -r "$1" "cse:~/cs1521/23t2/tutes/$1"
ssh -t cse "chmod 755 ~/cs1521/23t2/tutes/$1"

