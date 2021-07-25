#Base image
FROM debian:buster
#I'm author of this and I DNK why you should know this
LABEL maintainer="Eiji Nena <enena@student.21-school.ru>"
#Script for up this container
ADD up.sh ./
#Additional configuration file nginx
ADD nginx.conf ./
#UPDATE!UPGRADE!PRAY FOR VIM!
RUN apt-get update && apt-get -y upgrade && apt-get -y install vim && \
	apt-get -y install	nginx		\
						openssl	&&	\
	chmod 700 ./up.sh			&&	\
	chmod 700 ./nginx.conf
ENTRYPOINT [ "./up.sh" ]