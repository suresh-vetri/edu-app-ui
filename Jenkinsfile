pipeline {
    agent any

  tools {
        nodejs 'Node' // Use the NodeJS version configured in Jenkins
    }
    environment {
        DOCKER_IMAGE = 'innovative-edu-ui:latest' // Name and tag for the Docker image
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
                    bat 'docker build -t .'
                }
            }
        }
      stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to a Docker registry (optional)
                    // Replace 'your-docker-registry' with your Docker registry URL
                    bat 'docker tag innovative-edu-ui localhost:5000/innovative-edu-ui'
                    bat 'docker localhost:5000/innovative-edu-ui'
                    bat 'docker pull localhost:5000/innovative-edu-ui'
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
