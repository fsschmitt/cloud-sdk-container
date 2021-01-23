# cloud-sandbox
A simple container for cloud-related development sandbox with tools for:
- Cloud providers CLIs (Azure, AWS, GCP)
- Infrastructure Provisioner (Terraform)
- Network troubleshooting
- etc.

## Pre-requisites

Set your dockerhub username as environment variable:
```
export DOCKERHUB_USERNAME=fsschmitt
```

## Build Docker Image
```
docker build . --tag ${DOCKERHUB_USERNAME}/cloud-sandbox
```

## Push Docker Image to dockerhub
```
docker push ${DOCKERHUB_USERNAME}/cloud-sandbox
```

## Run ephemeral docker container
```
docker run -t -i --rm ${DOCKERHUB_USERNAME}/cloud-sandbox:latest bash
```
