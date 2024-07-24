ARG version=3.14.1
FROM alpine:${version}
RUN apk add openjdk8
WORKDIR  /javahome
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.91/bin/apache-tomcat-9.0.91.tar.gz
RUN tar -zxvf apache-tomcat-9.0.91.tar.gz

EXPOSE 8080

WORKDIR /javahome/apache-tomcat-9.0.91/webapps
COPY target/myweb-0.0.1.war myweb.war
CMD ["/javahome/apache-tomcat-9.0.91/bin/catalina.sh","run"]
