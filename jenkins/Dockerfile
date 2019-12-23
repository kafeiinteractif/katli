FROM jenkins:latest

USER root
RUN apt-get update && apt-get install -y vim git curl wget
RUN curl -fsSL https://get.docker.com/ | sh
RUN curl -fsSL https://get.docker.com/gpg | apt-key add -
RUN curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

#USER jenkins
