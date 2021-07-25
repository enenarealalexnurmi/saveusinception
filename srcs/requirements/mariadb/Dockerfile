#Base image
FROM debian:buster
#I'm author of this and I DNK why you should know this
LABEL maintainer="Eiji Nena <enena@student.21-school.ru>"
#Script for up this container
ADD up.sh ./
#UPDATE!UPGRADE!PRAY FOR VIM!
RUN apt-get update && apt-get -y upgrade && apt-get -y install vim && \
#and of course default mysql-server is mariadb
	apt-get -y install default-mysql-server && \
#Give user permission for all:)
	chmod 700 up.sh
#Of course, if you need to raise it, you need to run UP-SCRIPT
ENTRYPOINT [ "./up.sh" ]