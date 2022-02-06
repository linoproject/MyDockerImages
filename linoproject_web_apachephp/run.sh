#!/bin/bash
if [ ! "$(ls -A /var/www/html)" ]; then
    echo "WARNING: No files in /var/www/html. Creating a simple index!"
    echo "Linoproject LAMP is ready!" > /var/www/html/index.html
fi
if [ -f "/var/run/apache2/apache2.pid" ]; then
    rm /var/run/apache2/apache2.pid
fi
source /etc/apache2/envvars
tail -F /var/log/apache2/* &

exec apache2 -D FOREGROUND

