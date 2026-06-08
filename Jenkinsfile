pipeline {
    agent any
    
    environment {
        DOCKER_HUB_REPO = 'pushkar36/finaletp'
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                script {
                    sh 'docker build -t ${DOCKER_HUB_REPO}:latest .'
                }
            }
        }
        
        stage('Login to Docker Hub') {
            steps {
                echo 'Logging in to Docker Hub...'
                script {
                    sh 'echo $DOCKER_HUB_CREDENTIALS_PSW | docker login -u $DOCKER_HUB_CREDENTIALS_USR --password-stdin'
                }
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                script {
                    sh 'docker push ${DOCKER_HUB_REPO}:latest'
                }
            }
        }
    }
    
    post {
        always {
            node {
                echo 'Pipeline execution completed.'
                sh 'docker logout'
            }
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
