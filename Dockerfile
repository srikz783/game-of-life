FROM tomcat:jdk8
LABEL author="srikanth"
EXPOSE 8080
ADD target/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
