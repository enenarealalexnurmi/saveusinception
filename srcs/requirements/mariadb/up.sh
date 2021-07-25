#!/usr/bin/env bash
sed -i 's/bind-ad/#bind-ad/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's/#port/port /g' /etc/mysql/mariadb.conf.d/50-server.cnf
chown -R mysql:mysql /var/lib/mysql
if [ ! -d var/lib/mysql/$MYSQL_DB_NAME ]; then
	service mysql start
	chmod 700 /var/run/mysqld/mysqld.sock
	mysql -u root -h localhost -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME"
	mysql -u root -h localhost -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
	mysql -u root -h localhost -e "GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'%'"
	mysql -u root -h localhost -e "FLUSH PRIVILEGES"
	mysqladmin -u root password $ROOT_PASS && sleep 1
	service mysql stop
fi
mkdir /var/run/mysqld
touch /var/run/mysqld/mysqld.pid
mkfifo /var/run/mysqld/mysqld.sock
chown -R mysql /var/run/mysqld
exec mysqld