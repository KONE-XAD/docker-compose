#!/bin/bash
chown webuser.webuser -R /code
/opt/remi/php71/root/usr/sbin/php-fpm --nodaemonize
