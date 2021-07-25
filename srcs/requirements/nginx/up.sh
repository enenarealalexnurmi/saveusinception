#!/usr/bin/env bash
if [ ! -d /etc/ssl/private/inception.key ]; then
    openssl req -x509 -nodes -days 1 -newkey rsa:2048 -subj "/C=RU/ST=Russia/L=Kazan/" \
        -keyout /etc/ssl/private/inception.key -out /etc/ssl/certs/inception.crt
    mv ./nginx.conf /etc/nginx/
fi
exec nginx -g 'daemon off;'