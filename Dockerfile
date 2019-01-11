FROM jenkins/jenkins:lts

MAINTAINER acefei

USER root
RUN apt-get update && apt-get install -y \
                      python3 \
                      python3-pip \
                   && rm -rf /var/lib/apt/lists/*

# drop back to the regular jenkins user - good practice
USER jenkins

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# automatically installing all plugins
COPY conf/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY scripts/init_*.groovy /usr/share/jenkins/ref/init.groovy.d/
