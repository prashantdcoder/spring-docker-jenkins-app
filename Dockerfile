# Start with a base image
FROM openjdk:21-jdk

# Set working directory
WORKDIR /app

# Copy the JAR file (from Maven/Gradle build)
COPY build/libs/spring-docker-jenkins-app-0.0.1-SNAPSHOT.jar spring-docker-jenkins-app.jar

# Expose the application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "spring-docker-jenkins-app.jar"]