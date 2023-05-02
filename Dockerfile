FROM tomcat:jdk17

COPY ./target/*.war /usr/local/tomcat/webapps/pet.war

EXPOSE 8080

USER tafari

CMD ["catalina.sh", "run"]