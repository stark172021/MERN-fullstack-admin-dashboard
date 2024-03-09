pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Check out the code from the repository
                git url: 'https://github.com/example/repository.git'
            }
        }
        
        stage('Build Frontend') {
            steps {
                dir('client') {
                    // Build the frontend (React) application
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Build Docker image for the application
                sh 'docker build -t mern-app .'
            }
        }
        
        stage('Deploy') {
            steps {
                // Run Docker container for the application
                sh "docker run -d -p 5001:5001 mern-app"
            }
        }
    }
}

