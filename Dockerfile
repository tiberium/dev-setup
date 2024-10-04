FROM ubuntu:focal

ARG TAGS

WORKDIR /usr/local/bin

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get install -y ansible && \
    apt-get install -y vim

COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yaml"]
