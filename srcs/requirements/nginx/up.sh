#!/usr/bin/env bash
openssl req -x509 -nodes -days 1 -newkey rsa:2048 -subj "/C=RU/ST=Russia/L=Kazan/" \
    -keyout /etc/ssl/private/inception.key -out /etc/ssl/certs/inception.crt
exec nginx -g 'daemon off;'