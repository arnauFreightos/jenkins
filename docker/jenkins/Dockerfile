FROM jenkins/jenkins:lts


USER root


# Install Git
RUN apt-get install -y git


ARG UID
# Create user and some useful stuff
RUN if [ "${UID}" > 0] ; then adduser -u ${UID} --disabled-password --gecos "" appuser ; else adduser --disabled-password --gecos "" appuser  ; fi;
RUN mkdir /home/appuser/.ssh
RUN chown -R appuser:appuser /home/appuser/
RUN echo "StrictHostKeyChecking no" >> /home/appuser/.ssh/config
RUN echo "export COLUMNS=300" >> /home/appuser/.bashrc
RUN echo "alias sf=/appdata/www/bin/console" >> /home/appuser/.bashrc


# Install prerequisites
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

# Add Docker's official GPG key
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

# Add Docker repository
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"


# Install Docker
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

# Install Docker Compose
RUN curl -fsSL https://github.com/docker/compose/releases/latest/download/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose


RUN apt-get update && \
      apt-get -y install sudo

# Add the "jenkins" user to the "docker" group
RUN usermod -a -G docker jenkins

USER jenkins
