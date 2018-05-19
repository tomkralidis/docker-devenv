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
	@echo " clean: remove container"
	@echo

run:
	docker run --name $(CONTAINER) -d -i -t -v /Users/tkralidi/Dev/:/home/tkralidi/Dev --hostname $(HOSTNAME) -p 8880:80 -p 8800:8000 $(IMAGE)

build:
	docker build -t $(IMAGE) .

login:
	docker exec -it $(CONTAINER) /bin/bash

login-root:
	docker exec -u 0 -it $(CONTAINER) /bin/bash

stop:
	docker stop $(CONTAINER)

clean:
	docker rm -f $(CONTAINER)
	docker rmi $(IMAGE)

.PHONY: help run build login login-root stop clean
