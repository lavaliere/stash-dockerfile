FROM centos
MAINTAINER Tracy Kennedy
USER root
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install git curl oracle-java7-installer
RUN curl -Lks http://www.atlassian.com/software/stash/downloads/binary/atlassian-stash-2.4.2.tar.gz -o /root/stash.tar.gz



EXPOSE