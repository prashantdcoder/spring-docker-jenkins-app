pipeline {

    agent any
    
    environment {
        DOCKER_IMAGE = 'spring-docker-jenkins-app'
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
                sh './gradlew --version'
                sh './gradlew clean build --refresh-dependencies --no-daemon' // Build the JAR file
            }
        }
       stage('Build Docker Images') {
           steps {
               script {
                   sh 'docker-compose -f $DOCKER_COMPOSE_FILE build'
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
        stage('Start Services') {
            steps {
                script {
                    echo "Running docker services..."
                    sh 'docker-compose -f $DOCKER_COMPOSE_FILE up -d'
                }
            }
        }

//         post {
//             always {
//                 cleanWs()
//             }
//         }

    }
}
