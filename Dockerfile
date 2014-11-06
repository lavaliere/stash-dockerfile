FROM centos
MAINTAINER Tracy Kennedy
USER root
RUN yum -y update && yum -y upgrade
RUN yum -y install git curl tar wget oracle-java7-installer vim

# install jdk 7
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-x64.tar.gz"
RUN tar xzf jdk-7u67-linux-x64.tar.gz -C /usr/bin


#install stash
RUN curl -Lks http://www.atlassian.com/software/stash/downloads/binary/atlassian-stash-2.4.2.tar.gz -o /root/stash.tar.gz
RUN mkdir /opt/stash
RUN tar zxf /root/stash.tar.gz --strip=1 -C /opt/stash
RUN printf "AddressFamily inet" >> /etc/ssh/ssh_config 

ENV STASH_HOME /opt/stash
ENV JAVA_HOME /usr/bin/jdk1.7.0_67

EXPOSE 7991 7990 22 8006
ENTRYPOINT ["/opt/stash/bin/start-stash.sh", "-fg"]