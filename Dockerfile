FROM jenkins/jenkins:lts
EXPOSE 8080
EXPOSE 50000

ENV JENKINS_OPTS --httpPort=-1 --httpsPort=8080
ENV AWS_ACCESS_KEY_ID xxxxxxxxxxxxxxxxxxxxxxxxxxxx
ENV AWS_SECRET_ACCESS_KEY xxxxxxxxxxxxxxxxxxxxxxxxxxxx

USER root
RUN apt update
RUN apt -y install rsync
RUN apt -y install python3 openssl groff python3-venv && \
  wget -O /tmp/awscli-bundle.zip https://s3.amazonaws.com/aws-cli/awscli-bundle.zip && \
  unzip -d /tmp/ /tmp/awscli-bundle.zip && \
  python3 /tmp/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
  rm -f /tmp/awscli-bundle.zip && \
  rm -rf /tmp/awscli-bundle

#USER root
RUN apt clean && apt autoclean

USER jenkins
