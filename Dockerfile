FROM phusion/baseimage
MAINTAINER simon@vans-colina.com

ENV HOME /home/jenkins
# RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
CMD ["/sbin/my_init"]


RUN apt-get -y install software-properties-common python-software-properties
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN apt-get -y install git curl  wget
RUN wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
RUN yes | apt-get install oracle-java7-installer
RUN useradd -d /home/jenkins jenkins
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh
EXPOSE 8080
RUN mkdir /etc/service/jenkins
ADD run.sh /etc/service/jenkins/run

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

