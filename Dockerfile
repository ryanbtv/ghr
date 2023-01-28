FROM catthehacker/ubuntu:pwsh-latest

WORKDIR /workdir
COPY . ./

# Install Ansible & tool(s) used by ansible
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py 
RUN python3 get-pip.py 
RUN python3 -m pip install ansible
RUN python3 -m pip install jmespath
RUN python3 -m pip install uptime-kuma-api
RUN python3 -m pip install paramiko
RUN python3 -m pip install ansible-pylibssh
RUN ansible --version

# Install NodeJS
ENV NODE_VERSION=16.13.0
ENV NVM_VERSION=0.39.0
RUN apt-get install -y curl 
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version