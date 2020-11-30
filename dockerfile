FROM maven:3.6.3-jdk-8 as BUILD
COPY src /usr/src/myapp/src
COPY pom.xml /usr/src/myapp
RUN mvn -f /usr/src/myapp/pom.xml clean package

FROM tomcat:9.0
COPY --from=BUILD /usr/src/myapp/target/project-ucll.war /usr/local/tomcat/webapps/project-ucll.war
ENV TZ=Europe/Brussels
EXPOSE 8080