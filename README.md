# cloud-sandbox
A simple container for cloud-related development sandbox with tools for:
- Cloud providers CLIs (Azure, AWS, GCP)
- Infrastructure Provisioner (Terraform)
- Network troubleshooting
- etc.

## Sandbox pre-requesites (credentials)
Create a `.env` file containing the variables for authenticating into the cloud providers' cli, as for example:
```
# AWS CLI Configuration
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_DEFAULT_OUTPUT=json
```

## Docker build / run pre-requisites

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
