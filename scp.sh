#!/bin/bash 
for i in {1..3}; do vagrant scp config.txt slave${i}:~; done
for i in {1..3}; do vagrant scp host_init.py slave${i}:~; done
