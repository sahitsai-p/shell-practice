#!/bin/bash

echo "all args passed to script: $@"
echo "no of args passed to script: $#"
echo "script name: $0"
echo "present directory: $PWD"
echo "who is running script: $USER"
echo "home directory of current user: $HOME"
echo "PID of instance: $$"
sleep 100 &
echo "PID of background process: $!"
echo " all args passed to script: $*"
