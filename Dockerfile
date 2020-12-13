FROM cimg/openjdk:11.0
MAINTAINER "nomadfoodtruckapp"

USER root

RUN curl https://github.com/cli/cli/releases/download/v0.10.1/gh_0.10.1_linux_amd64.deb

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install


RUN which aws

USER circleci

CMD [ "/bin/sh" ]
