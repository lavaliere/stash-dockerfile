FROM centos
MAINTAINER Tracy Kennedy
USER root
RUN yum -y update && yum -y upgrade
RUN yum -y install git curl oracle-java7-installer tar

RUN curl -Lks http://www.atlassian.com/software/stash/downloads/binary/atlassian-stash-2.4.2.tar.gz -o /root/stash.tar.gz
RUN mkdir /opt/stash
RUN tar zxf /root/stash.tar.gz --strip=1 -C /opt/stash
RUN mkdir /opt/stash-home
RUN export STASH_HOME=/opt/stash-home

EXPOSE 7991 22 8080
ENTRYPOINT ["/opt/stash/bin/start-stash.sh", "-fg"]