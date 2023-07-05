FROM maven:3.8.2-jdk-11 AS builder
WORKDIR /usr/src/app
COPY src ./src
COPY pom.xml .
RUN mvn clean install -DskipTests

FROM openjdk:11.0.11-jdk-slim
WORKDIR /usr/app
COPY --from=builder /usr/src/app/target/eurekaServer.jar /usr/app/eurekaServer.jar
ENV PATH="${PATH}:${JAVA_HOME}/bin"
EXPOSE 8761
ENTRYPOINT ["java", "-jar", "/usr/app/eurekaServer.jar"]