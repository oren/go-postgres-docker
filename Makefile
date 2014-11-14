pwd := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

test-browser:
	docker exec -it web_server ./node_modules/.bin/nightwatch

dev: db setup web_server

db:
	docker run --name db -d postgres

setup:
	ln -sf docker/setup Dockerfile
	docker build -t setup .
	docker run --rm --link db:db --name setup setup

web-server:
	ln -sf docker/web_server Dockerfile
	docker build -t web_server .
	docker run --rm -ti -p 3000:3000 -v $(pwd):/go/src/app --link db:db -e DISPLAY=$(DISPLAY) -v /tmp/.X11-unix:/tmp/.X11-unix --name web_server web_server /bin/bash

prod:
	ln -sf docker/web_server_prod Dockerfile
	docker build -t web_server_prod .

rm:
	# stop and rm all containers
	-docker stop $(shell docker ps -q)
	docker rm $(shell docker ps -aq)

rmi:
	# delete images that are not used by any tagged image
	-docker rmi $(shell docker images | grep "<none>" | awk '{print $3}')

.PHONY: deploy test db setup web_server rm
