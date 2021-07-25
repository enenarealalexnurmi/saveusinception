#!/usr/bin/env bash
sed -i 's@listen = /run/php/php7.3-fpm.sock@listen = 9000@g' /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php
touch /run/php/php7.3-fpm.pid
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*
#if [ ! -f /var/www/html/wp-config.php ]; then
	mkdir -p /var/www/html/
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	cd var/www/html/
	wp core download --allow-root
	sed -i "s/_MYSQL_DB_NAME/'$MYSQL_DB_NAME'/g" /wp-config.php
    sed -i "s/_MYSQL_USER/'$MYSQL_USER'/g" /wp-config.php
    sed -i "s/_MYSQL_PASSWORD/'$MYSQL_PASSWORD'/g" /wp-config.php
    sed -i "s/_MYSQL_HOST/'$MYSQL_HOST'/g" /wp-config.php
    sed -i "s/_WP_TABLE_PREFIX/'$WP_TABLE_PREFIX'/g" /wp-config.php
    mv /wp-config.php /var/www/html/
    wp core install						\
		--allow-root					\
		--url=$WP_URL 					\
		--title=$WP_TITLE_SITE			\
        --admin_user=$WP_ADMIN_LOGIN	\
        --admin_password=$WP_ADMIN_PASS	\
        --admin_email=$WP_ADMIN_MAIL
    wp user create --allow-root $WP_SECOND_USER_LOGIN $WP_SECOND_USER_EMAIL --user_pass=$WP_SECOND_USER_PASS
#fi
exec php-fpm7.3 -F