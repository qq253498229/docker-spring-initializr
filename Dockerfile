FROM docker.io/centos:7

WORKDIR /opt

ENV JAVA_HOME=/etc/alternatives/java_sdk_11

RUN yum install java-11-openjdk-devel git -y \
    && curl https://archive.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz | tar xvz -C /opt/ --exclude="*.cmd" --exclude="docs" --exclude="example" --exclude="licenses" \
    && ln -s /opt/apache-maven-3.6.0/bin/mvn /bin/mvn \
    && git clone https://github.com/spring-io/start.spring.io.git /opt/site \
    && cd /opt/site && mvn -B install -Dmaven.test.skip=true \
    && cd /opt/site/start-site  && mvn -B package -Dmaven.test.skip=true \
    && mv target/start-site.jar /opt/app.jar \
    && cd /opt && rm -rf ~/.m2/ /opt/site/ /bin/mvn /opt/apache-maven* \
    && yum remove git -y && yum autoremove -y \
    && yum clean all && rm -rf /tmp/* && rm -rf /usr/share/doc/ && rm -rf /usr/share/man

CMD ["/etc/alternatives/java_sdk_11/bin/java","-jar","/opt/app.jar"]