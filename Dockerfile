FROM debian:buster-20210111-slim

# System Environment Variables
ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ=Europe/Lisbon

# Tooling Versions
ENV TERRAFORM_VERSION=${TERRAFORM_VERSION:-0.12.29}
ENV GCLOUD_CLI_VERSION=${GCLOUD_CLI_VERSION:-324.0.0}
ENV AZURE_CLI_VERSION=${AZURE_CLI_VERSION:-2.18.0}
ENV AWS_CLI_VERSION=${AWS_CLI_VERSION:-2.1.21}
ENV ANSIBLE_VERSION=${ANSIBLE_VERSION:-2.9.11}

# Install apt-get tools
RUN apt update \
  && apt install -y \
    # Development Tools
    build-essential curl file git vim \
    apt-transport-https ca-certificates lsb-release gnupg \
    python3 python3-setuptools python3-pip \
  # Network Troubleshooting
    dnsutils \
    inetutils-ping \
    jq \
    nmap \
    telnet \
    traceroute \
    wget \
    mtr \
    apache2-utils \
  && pip3 install --upgrade pip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install brew tools
RUN pip3 --no-cache-dir install --upgrade terraenv

# Install Terraform
RUN terraenv terraform install ${TERRAFORM_VERSION}
RUN terraenv terraform use ${TERRAFORM_VERSION}

# Install gcloud
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk=${GCLOUD_CLI_VERSION}-0 -y

# Install Azure cli
RUN pip3 --no-cache-dir install azure-cli==${AZURE_CLI_VERSION}

# Install aws-cli
RUN pip3 --no-cache-dir install git+git://github.com/aws/aws-cli.git#${AWS_CLI_VERSION}

# Install Ansible
RUN pip3 --no-cache-dir install ansible==${ANSIBLE_VERSION}

CMD ["/bin/bash"]
