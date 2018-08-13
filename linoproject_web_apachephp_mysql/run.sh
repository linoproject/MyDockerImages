#!/bin/bash
rm /var/run/apache2/apache2.pid
source /etc/apache2/envvars
tail -F /var/log/apache2/* &
exec /etc/init.d/mysql start &

# Wait for mysql server is running
sleep 10

exec apache2 -D FOREGROUND

