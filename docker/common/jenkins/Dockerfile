FROM jenkinsci/blueocean

#ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

USER root

#RUN cat /etc/apk/repositories
#RUN echo "http://ftp.halifax.rwth-aachen.de/alpine/v3.16/main" >> /etc/apk/repositories
#RUN echo "http://ftp.halifax.rwth-aachen.de/alpine/v3.16/community" >> /etc/apk/repositories
#RUN apk update
RUN apk add --no-cache make gettext docker-cli-compose 

USER jenkins

#COPY ./common/jenkins/plugins.txt /usr/share/jenkins/ref/plugins.txt
#RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
