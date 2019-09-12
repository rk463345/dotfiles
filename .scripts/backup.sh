#!/bin/bash
rsync -a --delete -e ssh /home/kdb424 192.168.0.30:/mnt/6tb/backups/homedirs/ryzen 
