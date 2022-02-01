#!/bin/bash
if [ ! "$(ls -A /var/lib/mysql)" ]; then
    #echo "lower_case_table_names = 1" >> /etc/mysql/mysql.conf.d/mysqld.cnf
    echo "WARNING: DB reinitialization"
    mysqld --defaults-file=/etc/mysql/my.cnf --initialize-insecure --user=mysql --console
fi
if [ ! "$(ls -A /var/www/html)" ]; then
    echo "WARNING: No files in /var/www/html. Creating a simple index!"
    echo "Linoproject LAMP is ready!" > /var/www/html/index.html
fi
if [ -f "/var/run/apache2/apache2.pid" ]; then
    rm /var/run/apache2/apache2.pid
fi
source /etc/apache2/envvars
tail -F /var/log/apache2/* &
exec /etc/init.d/mysql start &

# Wait for mysql server is running
sleep 10

exec apache2 -D FOREGROUND

