pipeline {
    agent any
tools {
  nodejs "NodeJS_22"
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
                    script {
                    echo '${NODE_VERSION}' 
                    sh 'curl -sL https://deb.nodesource.com/setup_22.x | bash -'
                    sh 'apt-get install -y nodejs'
                }
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Test') {
            steps {
                sh 'npm run test -- --watch=false'
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
