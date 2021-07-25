#Base image
FROM debian:buster
#I'm author of this and I DNK why you should know this
LABEL maintainer="Eiji Nena <enena@student.21-school.ru>"
#UPDATE!UPGRADE!PRAY FOR VIM! HTOP to find out PID! [MAIN LAYER]
RUN apt-get update && apt-get -y upgrade && apt-get -y install vim htop
#and of course default mysql-server is mariadb
RUN apt-get -y install default-mysql-server
#Script for up this container
ADD up.sh ./
#Give user permission for all:)
RUN chmod 700 up.sh
#Of course, if you need to raise it, you need to run UP-SCRIPT
ENTRYPOINT [ "./up.sh" ]