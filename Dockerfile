FROM tomcat:8.0.20-jre8
MAINTAINER "CHAITHANYA"
LABEL "gmail"="chaithanya1812@gmail.com"
COPY ./target/*.war  /usr/local/tomcat/webapps/
WORKDIR /usr/local/tomcat/webapps/
