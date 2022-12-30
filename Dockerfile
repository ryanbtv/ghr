FROM ghcr.io/catthehacker/ubuntu:pwsh-latest

WORKDIR /workdir
COPY . ./

# Install Ansible
RUN \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3 get-pip.py \
    && python3 -m pip install ansible