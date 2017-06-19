FROM jenkins:2.46.3
USER root
RUN wget https://download.docker.com/linux/static/stable/x86_64/docker-17.03.1-ce.tgz \
 && tar -xf docker-17.03.1-ce.tgz \
 && mv docker/docker /usr/bin/docker \
 && chmod +x /usr/bin/docker \
 && rm -fr docker*
COPY jenkins_home /usr/share/jenkins/ref
COPY jenkins.sh /usr/local/bin/jenkins.sh
