NAME = inception
YAML	= ./srcs/docker-compose.yaml
VLMS	= /home/enena/data/wp/* /home/enena/data/db/*

$(NAME):
	sudo docker-compose -f $(YAML) up --build

all: $(NAME)

up:
	sudo docker-compose -f $(YAML) up

down:
	sudo docker-compose  -f $(YAML) down

re: fclean all

clean: down
	-sudo docker volume rm $$(sudo docker volume ls -q)
	sudo rm -rf $(VLMS)

fclean: clean
	-sudo docker rm $$(cd ./srcs/ && sudo docker-compose ps -q)
	-sudo docker rmi -f $$(sudo docker images -qa)
	#-sudo docker rm -f $$(sudo docker ps -qa)
	-sudo docker volume rm $$(sudo docker volume ls -q)
	-sudo docker network rm $$(sudo docker network ls -q)
	-sudo docker rm -f $$(sudo docker network ls -q)
	
info:
	@echo "**** IMAGES **** "
	@sudo docker images 
	@echo ""
	@echo "**** DOCKER PS **** "
	@cd ./srcs/ &&  sudo docker-compose ps
	@echo ""
	@echo "**** VOLUMES **** " 
	@sudo docker volume ls
	@echo ""
	@echo "**** NETWORKS **** " 
	@sudo docker network ls



