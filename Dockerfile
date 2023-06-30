FROM tomcat:8-jre8
RUN rm -rf /usr/local/tomcat/webapps/*
COPY springboot/gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
