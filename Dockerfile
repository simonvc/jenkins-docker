FROM ubuntu
MAINTAINER simon@vans-colina.com

RUN apt-get -y install software-properties-common python-software-properties
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN apt-get -y install git curl  wget
RUN wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
RUN yes | apt-get install oracle-java7-installer
EXPOSE 8080
CMD /usr/bin/java -jar jenkins.war
