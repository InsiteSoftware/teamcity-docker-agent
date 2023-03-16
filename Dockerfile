FROM jetbrains/teamcity-agent:latest

LABEL maintainer="Jeff Schumacher <jschumacher@insitesoft.com>"

USER root

RUN apt-get update && \
    apt-get install -y software-properties-common apt-utils && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y \
        ansible \
        wget \
        docker-ce-cli \
        docker-buildx-plugin \
        docker-compose-plugin \
    && \
    wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get -y install powershell && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    pwsh -Command "Install-Module -Name SqlServer -AcceptLicense -Repository PSGallery -Force" && \
    ssh-keyscan -t rsa github.com >> /etc/ssh/ssh_known_hosts

USER buildagent
