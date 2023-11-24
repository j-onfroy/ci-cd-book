# Stage 1: Build the application using Maven
FROM maven:4.0.0-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code and build the application
COPY src /app/src
RUN mvn clean package -DskipTests

# Stage 2: Create a lightweight image with the JAR file
FROM adoptopenjdk:17-jre AS runtime
WORKDIR /app
COPY --from=build /app/target/ci-cd-book.jar /app/ci-cd-book.jar
EXPOSE 8080
CMD ["java", "-jar", "ci-cd-book.jar"]
