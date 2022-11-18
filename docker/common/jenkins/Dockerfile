FROM jenkinsci/blueocean

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

USER root

RUN apk add --no-cache py-pip python3-dev make gettext \
    && pip3 install docker-compose

USER jenkins

COPY ./common/jenkins/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt