FROM openjdk:8-jre
COPY ./initializr/initializr-service/target/initializr-service.jar .
CMD ["java","-jar","initializr-service.jar"]