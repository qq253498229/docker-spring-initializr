FROM openjdk:8-jre
COPY initializr-service.jar .
CMD ["java","-jar","initializr-service.jar"]