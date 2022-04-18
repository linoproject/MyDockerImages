#!/bin/sh
if [ ! "$(ls -A /opt/app)" ]; then
    echo "WARNING: No files in /opt/app. Replacing with default!"
    cp -a /root/appbck/* /opt/app
    #cp /root/appbck/.* /opt/app
fi

yarn develop