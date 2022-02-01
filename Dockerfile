FROM tomcat:8.5.50-jdk8-openjdk
# COPY frontend/target/tasks.war C:/Arquivos de Programas/Apache Software Foundation/Tomcat 8.5/webapps/'tasks.war
ARG WAR_FILE
ARG CONTEXT

COPY ${WAR_FILE} C:/tomcat/webapps/${CONTEXT}.war