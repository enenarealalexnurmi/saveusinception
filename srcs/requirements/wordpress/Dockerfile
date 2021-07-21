FROM debian:buster

RUN apt update
RUN apt -y upgrade
RUN apt -y install vim              \
            php-fpm php-mysql       \
            php-mbstring php-gd     \
            redis-server php-redis  \
            wget

COPY start.sh ./
RUN chmod 700 ./start.sh

COPY wp-config.php ./
RUN chmod 700 /wp-config.php

ENTRYPOINT [ "./start.sh" ]
CMD [ "/usr/sbin/php-fpm7.3", "--nodaemonize" ]