FROM jetbrains/teamcity-agent:latest

MAINTAINER Jeff Schumacher <jschumacher@insitesoft.com>

RUN apt-get update && \
    apt-get install -y software-properties-common apt-utils && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible wget && \
    wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get -y install powershell && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*