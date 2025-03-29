pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'angular-app:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your repository
                git 'https://github.com/suresh-vetri/edu-app-ui.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    bat 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Run Docker Image') {
            steps {
                script {
                    // Run the Docker image
                    bat 'docker run -d -p 4200:4200 $DOCKER_IMAGE'
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Clean up the running Docker container after the build
                    bat 'docker ps -a -q --filter "ancestor=$DOCKER_IMAGE" | xargs docker rm -f'
                }
            }
        }
    }
}
