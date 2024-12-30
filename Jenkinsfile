pipeline {
    agent {
        docker {
            image 'openjdk:21-jdk' // Use a Maven Docker image with JDK
        }
    }
    environment {
        DOCKER_IMAGE = 'employee-crud'
    }
    stages {
        stage('Clone Repository') {
            steps {
                checkout scm // Pull code from the Git repository
            }
        }
        stage('Build App') {
            steps {
                sh 'gradlew clean build' // Build the JAR file
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }
        stage('Run Docker Container') {
            steps {
                sh 'docker run -d --name spring-boot-app -p 8080:8080 $DOCKER_IMAGE'
            }
        }
    }
}
