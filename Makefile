DOCKERHUB_USERNAME?=fsschmitt
IMAGE_TAG?=$(DOCKERHUB_USERNAME)/cloud-sandbox

build:
	docker build --tag $(IMAGE_TAG) .

push:
	docker push $(IMAGE_TAG)

run:
	docker run -t -i --env-file=.env --rm $(IMAGE_TAG):latest bash

run-privileged:
	docker run -t -i --env-file=.env --rm --privileged $(IMAGE_TAG):latest bash
