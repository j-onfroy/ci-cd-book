FROM openjdk:17
EXPOSE 8080
ADD target/cicd-book.jar cicd-book.jar 
ENTRYPOINT ["java","-jar","/cicd-book.jar"]