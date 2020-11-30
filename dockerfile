FROM maven:3.5-jdk-8 as BUILD
COPY src /usr/src/BS2_Labo6_StarterCode/src
COPY pom.xml /usr/BS2_Labo6_StarterCodeBS2_Labo6_StarterCode/myapp
RUN mvn -f /usr/BS2_Labo6_StarterCode/myapp/pom.xml clean package

FROM tomcat:7.0
COPY --from=BUILD /usr/src/BS2_Labo6_StarterCode/target/project-ucll.war /usr/local/tomcat/webapps/project-ucll.war
EXPOSE 8080
