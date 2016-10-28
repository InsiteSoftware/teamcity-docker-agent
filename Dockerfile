FROM jetbrains/teamcity-agent:latest

MAINTAINER Jeff Schumacher <jschumacher@insitesoft.com>

RUN apt-get update && \
    apt-get install -y ansible && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*