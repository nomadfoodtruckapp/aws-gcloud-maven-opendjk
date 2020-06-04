FROM openjdk:13-jdk-slim-buster
MAINTAINER "nomadfoodtruckapp"

USER root

RUN apt-get -qy update &&  apt-get -qy install lsb-release apt-utils curl apt-transport-https ca-certificates gnupg unzip openssh-client && \
    echo "deb http://packages.cloud.google.com/apt cloud-sdk-$(lsb_release -c -s) main" |  tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && apt-get -qy install google-cloud-sdk kubectl

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

CMD [ "echo", "Hello World!"]
