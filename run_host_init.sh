#!/bin/bash 
for i in {1..3}; do vagrant ssh slave${i} --command 'python host_init.py'; done 
