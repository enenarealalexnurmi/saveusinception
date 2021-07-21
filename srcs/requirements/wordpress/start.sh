#!/usr/bin/env bash
sed -i 's@listen = /run/php/php7.3-fpm.sock@listen = 9000@g' /etc/php/7.3/fpm/pool.d/www.conf
sed -i 's/supervised no/supervised systemd/g' /etc/redis/redis.conf
mkdir -p /run/php
touch /run/php/php7.3-fpm.pid
chown -R www-data:www-data /var/www/*
chown -R 755 /var/www/*
if [ ! -f /var/www/html/wp-config.php ]; then
    echo "DEBUG: WP Installation"
    mkdir -p /var/www/html/
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    cd var/www/html/
    wp core download --allow-root
    chmod 777 /wp-config.php

    echo "DEBUG: wp-config.php editing"
    sed -i "s/_MYSQL_DB_NAME/'$MYSQL_DB_NAME'/g" /wp-config.php
    sed -i "s/_MYSQL_USER/'$MYSQL_USER'/g" /wp-config.php
    sed -i "s/_MYSQL_PASSWORD/'$MYSQL_PASSWORD'/g" /wp-config.php
    sed -i "s/_MYSQL_HOST/'$MYSQL_HOST'/g" /wp-config.php
    sed -i "s/_WORDPRESS_TABLE_PREFIX/'$WORDPRESS_TABLE_PREFIX'/g" /wp-config.php
    mv /wp-config.php /var/www/html/

    echo "DEBUG: WP installing"
    wp core install --allow-root \
        --url=enena.42.fr \
        --title=enena \
        --admin_user=$WORDPRESS_ADMIN_NICK \
        --admin_password=$WORDPRESS_ADMIN_PASS \
        --admin_email=$WORDPRESS_ADMIN_MAIL
    wp user create --allow-root $WORDPRESS_USR_NICK $WORDPRESS_USR_MAIL --user_pass=$WORDPRESS_USR_PASS
fi
service redis-server start
exec "$@"
