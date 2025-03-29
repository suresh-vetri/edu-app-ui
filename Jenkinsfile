pipeline {
    agent any

  tools {
        nodejs 'Node' // Use the NodeJS version configured in Jenkins
    }
    environment {
        NODE_VERSION = '22.x' // Specify the Node.js version
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
