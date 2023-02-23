FROM ubuntu:18.04

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

# Install prerequisities for Ansible
RUN apt-get update
RUN apt-get -y install python3 python3-nacl python3-pip libffi-dev

# Install ansible
RUN pip3 install ansible