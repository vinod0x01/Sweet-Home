FROM maven:3.8.2-jdk-11 AS builder
WORKDIR /usr/src/app
COPY src ./src
COPY pom.xml .
RUN mvn clean compile assembly:single

FROM openjdk:11.0.11-jdk-slim
WORKDIR /usr/app
COPY --from=builder /usr/src/app/target/notificationService-jar-with-dependencies.jar /usr/app/notificationService.jar
ENV PATH="${PATH}:${JAVA_HOME}/bin"
#EXPOSE 8761
ENTRYPOINT ["java", "-jar", "/usr/app/notificationService.jar"]