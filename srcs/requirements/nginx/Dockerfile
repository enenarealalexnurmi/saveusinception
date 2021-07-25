#Base image
FROM debian:buster
#I'm author of this and I DNK why you should know this
LABEL maintainer="Eiji Nena <enena@student.21-school.ru>"
#UPDATE!UPGRADE!PRAY FOR VIM! HTOP to find out PID! [MAIN LAYER]
RUN apt-get update && apt-get -y upgrade && apt-get -y install vim htop
#NGINX web-server
RUN apt-get -y install nginx
#OpenSSL for generating self-signed certificate 
RUN apt-get -y install openssl
#Script for up this container
ADD up.sh ./
#Additional configuration file nginx
ADD nginx.conf ./
#Give user permission for all:) and moving nginx configuration in right place
RUN chmod 700 ./up.sh && chmod 700 ./nginx.conf && mv ./nginx.conf /etc/nginx/
ENTRYPOINT [ "./up.sh" ]