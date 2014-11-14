## install docker on mac
wget https://github.com/boot2docker/osx-installer/releases/download/v1.3.0/Boot2Docker-1.3.0.pkg
open Boot2Docker-1.3.0.pkg
boot2docker init
boot2docker start
add 3 lines to bashrc
$(boot2docker shellinit)

## misc commands
docker rmi $(sudo docker images -aq)  # delete all images
docker rm $(sudo docker ps -aq)       # delete all containers
docker logs labs
docker inspect --format {{.NetworkSettings.IPAddress}} db                                        # find the ip address of db container
sudo -u postgres psql -h $(docker inspect --format {{.NetworkSettings.IPAddress}} db) postgres   # connect to psql
sudo -u postgres psql -h 172.17.0.11 < setup.sql                                                 # setup db
