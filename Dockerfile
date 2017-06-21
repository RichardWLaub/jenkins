FROM jenkins:2.46.3
USER root

# Install Docker
RUN wget https://download.docker.com/linux/static/stable/x86_64/docker-17.03.1-ce.tgz \
 && tar -xf docker-17.03.1-ce.tgz \
 && mv docker/docker /usr/bin/docker \
 && chmod +x /usr/bin/docker \
 && rm -fr docker*

# Install Compose
RUN curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
  && chmod +x /usr/local/bin/docker-compose

# Copy in jenkins_home and start script
COPY jenkins_home /usr/share/jenkins/ref
COPY jenkins.sh /usr/local/bin/jenkins.sh
