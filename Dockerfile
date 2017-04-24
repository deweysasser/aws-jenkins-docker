FROM jenkinsci/jenkins:lts
MAINTAINER Dewey Sasser <dewey@sasser.com>

USER root
RUN \
    apt-get -y update && \
    apt-get -y install python-pip python-yaml && \
    pip install awscli

RUN wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | apt-key add -
RUN wget -O /etc/apt/sources.list.d/s3tools.list http://s3tools.org/repo/deb-all/stable/s3tools.list
RUN apt-get update
RUN apt-get install -y s3cmd


USER jenkins