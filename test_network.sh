#!/bin/bash

ping -c 1 google.com > /dev/null 2>&1

if [ $? -eq 0 ]; then
    exit 0  # success
else
    exit 1  # fail
fi
