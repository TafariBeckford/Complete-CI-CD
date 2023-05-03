FROM tomcat:jdk17

COPY ./target/*.war /usr/local/tomcat/webapps/pet.war

EXPOSE 8080

RUN useradd -u 8877 tafari

USER tafari

CMD ["catalina.sh", "run"]