FROM phusion/baseimage
MAINTAINER simon@vans-colina.com

RUN apt-get -y install software-properties-common python-software-properties
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN apt-get -y install git curl  wget
RUN wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
RUN yes | apt-get install oracle-java7-installer
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -d /home/jenkins jenkins
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN mkdir /etc/service/jenkins
ADD run.sh /etc/service/jenkins/run
RUN chmod 777 /etc/service/jenkins/run
RUN mkdir /home/jenkins
RUN chown -R jenkins /home/jenkins

ENV HOME /home/jenkins
EXPOSE 8080
CMD ["/sbin/my_init"]
