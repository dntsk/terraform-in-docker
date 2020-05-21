FROM alpine:latest

WORKDIR /opt

RUN apk --update add wget ca-certificates \
 && rm -rf /var/cache/apk/*

ARG TF_VERSION=0.12.25
RUN wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip
RUN unzip terraform_${TF_VERSION}_linux_amd64.zip
RUN mv ./terraform /usr/bin/terraform
