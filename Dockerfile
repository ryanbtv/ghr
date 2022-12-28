FROM mcr.microsoft.com/powershell:lts-debian-11

WORKDIR /workdir
COPY . ./

# Install git
RUN \
    apt-get update \
    && apt-get install -y git openssh-client