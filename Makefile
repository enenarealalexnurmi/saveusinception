NAME = inception
YAML	= ./srcs/docker-compose.yaml
VLMS	= /home/enena/data/wp/* /home/enena/data/db/*

$(NAME):
	sudo docker-compose -f $(YAML) up -d --build

all: $(NAME)

up:
	sudo docker-compose -f $(YAML) up -d

down:
	sudo docker-compose  -f $(YAML) down

re: clean all

clean: down
	-sudo docker rmi -f $$(sudo docker images -qa)
	-sudo docker volume rm $$(sudo docker volume ls -q)
	-sudo docker network rm $$(sudo docker network ls -q)
	-sudo docker rm $$(cd ./srcs/ && sudo docker-compose ps -q)
	
stat:
	@echo "[IMAGES]"
	@sudo docker images 
	@echo "--------------------------------------"
	@echo "[DOCKER CONTAINERS]"
	@cd ./srcs/ &&  sudo docker-compose ps
	@echo "--------------------------------------"
	@echo "[VOLUMES]" 
	@sudo docker volume ls
	@echo "--------------------------------------"
	@echo "[NETWORKS]" 
	@sudo docker network ls
	@echo "--------------------------------------"

.PHONY:	all up down clean stat