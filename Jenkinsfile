pipeline {

    agent {
        docker {
            image 'openjdk:21-jdk' // Use a Maven Docker image with JDK
        }
    }
    environment {
        DOCKER_IMAGE = 'employee-crud'
        DOCKER_COMPOSE_FILE = 'docker-compose.yml'
    }
    stages {
        stage('Clone Repository') {
            steps {
                checkout scm // Pull code from the Git repository
            }
        }
        stage('Build App') {
            steps {
                echo "Building app..."
                sh 'chmod +x ./gradlew'
                sh './gradlew clean build' // Build the JAR file
            }
        }
       stage('Build Docker Images') {
           steps {
               script {
                   sh 'docker-compose -f $DOCKER_COMPOSE_FILE build'
               }
           }
       }
        stage('Start Services') {
            steps {
                script {
                    echo "Running docker services..."
                    sh 'docker-compose -f $DOCKER_COMPOSE_FILE up -d'
                }
            }
        }
        stage('Test case') {
            steps {
                script {
                    echo "Running test cases..."
                    sh './gradlew test'
                }
            }
        }
    }
}
