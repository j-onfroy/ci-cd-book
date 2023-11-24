FROM maven:3.9-eclipse-temurin-17-alpine AS MAVEN_BUILD

MAINTAINER B29

COPY pom.xml /build/
COPY src /build/src/

WORKDIR /build/
RUN mvn package

FROM openjdk:17-oracle

WORKDIR /app

COPY --from=MAVEN_BUILD /build/target/ci-cd-book.jar /app/
CMD ["java", "-jar", "ci-cd-book.jar"]
