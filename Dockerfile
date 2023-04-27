FROM tomcat:jdk17

COPY ./target/*.war /usr/local/tomcat/webapps/pet.war

EXPOSE 8080

CMD ["catalina.sh", "run"]