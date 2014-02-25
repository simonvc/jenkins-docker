#!/bin/sh -x

echo Starting Jenkins using /etc/service/jenkins/run
/sbin/setuser jenkins /usr/bin/java -jar /jenkins.war

