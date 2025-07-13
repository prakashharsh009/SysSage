#!/bin/bash

if df -h | grep '/$' | awk '{print $5+0}' | grep -q '[0-9]\{2,\}'; then
    exit 0
else
    exit 1
fi
