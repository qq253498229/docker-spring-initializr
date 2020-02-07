FROM docker.io/library/ubuntu:eoan

WORKDIR /opt

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

RUN apt update && apt upgrade -y \
    && apt install openjdk-11-jdk-headless maven git node-gyp -y \
    && git clone https://github.com/spring-io/start.spring.io.git /opt/site \
    && cd /opt/site \
    && _JAVA_OPTIONS=-Dlogging.level.org.springframework=ERROR mvn clean package -B -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn \
    && cd /opt/site/start-site && mvn -B package -Dmaven.test.skip=true \
    && mv target/start-site.jar /opt/app.jar \
    && cd /opt && rm -rf ~/.m2/ /opt/site/ \
    && apt purge git maven node -y && apt autoremove -y \
    && rm -rf /tmp/* && rm -rf /usr/share/doc/ && rm -rf /usr/share/man

CMD ["/usr/lib/jvm/java-11-openjdk-amd64/bin/java","-jar","/opt/app.jar"]