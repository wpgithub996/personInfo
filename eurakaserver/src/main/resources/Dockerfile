FROM hub.c.163.com/library/java:8-jre
VOLUME /tmp

ADD *.jar app.jar

#暴露端口号
EXPOSE 8761

ENTRYPOINT [ "java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app.jar" ]