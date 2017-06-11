IMAGE=devenv
CONTAINER=devenv-container
HOSTNAME=mandalor

help:
	@echo
	@echo "make targets:"
	@echo " run: run container"
	@echo " build: build image"
	@echo " login: login to container"
	@echo " stop: stop container"
	@echo

run:
	docker run --name $(CONTAINER) -d -i -t -v /Users/tkralidi/Dev/:/home/tkralidi/Dev --hostname $(HOSTNAME) $(IMAGE)

build:
	docker build -t $(IMAGE) .

login:
	docker exec -it $(CONTAINER) /bin/bash

stop:
	docker stop $(CONTAINER)
	docker rm -f $(CONTAINER)

.PHONY: help run build login stop
