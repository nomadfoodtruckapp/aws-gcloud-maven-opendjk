FROM vincit/circleci-openjdk-gcloud:8-jdk

USER root

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install


USER circleci

CMD [ "echo", "Hello!"]
