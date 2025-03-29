pipeline {
    agent any

  tools {
        nodejs 'Node' // Use the NodeJS version configured in Jenkins
    }
    environment {
        DOCKER_IMAGE = 'innovative-edu-ui:latest // Name and tag for the Docker image
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/suresh-vetri/edu-app-ui.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                        bat 'npm install'
                        echo 'installation completed.'
            }
        }

        stage('Build') {
            steps {
                 bat 'npm run build'
                  echo 'build completed.'
            }
        }

        stage('Package') {
            steps {
                archiveArtifacts artifacts: 'dist/**', fingerprint: true
            }
        }
      stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    bat 'docker build -t %DOCKER_IMAGE% .'
                }
            }
        }
      stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to a Docker registry (optional)
                    // Replace 'your-docker-registry' with your Docker registry URL
                    bat 'docker tag $DOCKER_IMAGE http://localhost:8088//$DOCKER_IMAGE'
                    bat 'docker push http://localhost:8088/$DOCKER_IMAGE'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
