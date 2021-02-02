BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
COMMIT := $(shell git rev-parse HEAD)
REPOSITORY=krol
PROJECT=wildfly-sample
PORT=8080
CONTAINER_PORT=8080

build:
	echo "Image: ${REPOSITORY}/${PROJECT}:$(BRANCH)"
	docker build -t ${REPOSITORY}/${PROJECT}:$(BRANCH) .

push:
	docker push ${REPOSITORY}/${PROJECT}:$(BRANCH)

run:
	docker run -it -p ${PORT}:${CONTAINER_PORT} ${REPOSITORY}/${PROJECT}:$(BRANCH)
