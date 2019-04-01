# Build stage
FROM maven:3.6.0-jdk-8-alpine AS build

WORKDIR /app
COPY . /app
RUN mvn clean package

FROM openjdk:8-jdk-alpine
WORKDIR /photon

COPY --from=build /app/target/photon-0.3.0.jar ./photon.jar

ENTRYPOINT ["java", "-jar", "photon.jar"]
