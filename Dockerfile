# Start with a base image
FROM openjdk:21-jdk

# Set working directory
WORKDIR /app

# Copy the JAR file (from Maven/Gradle build)
COPY build/libs/employee-crud-0.0.1-SNAPSHOT.jar employee-crud.jar

# Expose the application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "employee-crud.jar"]