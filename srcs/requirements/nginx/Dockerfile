FROM debian:buster

RUN apt update
RUN apt -y upgrade
RUN apt -y install vim nginx openssl
COPY start.sh ./
RUN chmod 777 ./start.sh
COPY ./nginx.conf ./
RUN chmod 777 ./nginx.conf
ENTRYPOINT [ "./start.sh" ]
CMD ["nginx", "-g", "daemon off;"]