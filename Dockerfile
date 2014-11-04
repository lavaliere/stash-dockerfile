FROM centos
MAINTAINER Tracy Kennedy
USER root
RUN yum -y update && yum -y upgrade
RUN yum -y install git curl tar java-1.7.0-openjdk java-1.7.0-openjdk-devel

#install stash
RUN curl -Lks http://www.atlassian.com/software/stash/downloads/binary/atlassian-stash-2.4.2.tar.gz -o /root/stash.tar.gz
RUN mkdir /opt/stash
RUN tar zxf /root/stash.tar.gz --strip=1 -C /opt/stash

ENV STASH_HOME /opt/stash
ENV JAVA_HOME /usr/

EXPOSE 7991 7990 22 8080

ENTRYPOINT ["/opt/stash/bin/start-stash.sh", "-fg"]