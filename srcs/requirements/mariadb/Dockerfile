FROM debian:buster

RUN apt update
RUN apt -y upgrade
RUN apt -y install vim default-mysql-server procps

COPY start.sh ./
RUN chmod 777 ./start.sh
ENTRYPOINT [ "./start.sh" ]
CMD ["mysqld"]