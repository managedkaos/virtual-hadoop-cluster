#!/bin/bash 
files="config.txt host_init.py"

for file in $files; do
    for i in {1..3}; do
        vagrant scp $file slave${i}:~;
    done
done
