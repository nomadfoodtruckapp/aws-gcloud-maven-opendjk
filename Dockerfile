FROM circleci/openjdk:13.0.2-jdk-buster
MAINTAINER "nomadfoodtruckapp"

USER root

RUN apt-get -qy update &&  apt-get -qy install lsb-release apt-utils curl apt-transport-https ca-certificates gnupg unzip && \
    echo "deb http://packages.cloud.google.com/apt cloud-sdk-$(lsb_release -c -s) main" |  tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -


RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

USER circleci

CMD [ "echo", "Hello World!"]
