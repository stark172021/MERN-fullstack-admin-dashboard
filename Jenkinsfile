pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'mern-app' // Docker image name
        MONGO_URL = 'mongodb://localhost:27017/your-database-name' // MongoDB URL
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Check out the code from the repository
                git url: 'https://github.com/prakash052101/MERN-fullstack-admin-dashboard.git'
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
                sh "docker build -t $DOCKER_IMAGE ."
            }
        }
        
        stage('Deploy') {
            steps {
                // Run Docker container for the application
                sh "docker run -d -p 5001:5001 -e MONGO_URL=$MONGO_URL $DOCKER_IMAGE"
            }
        }
    }
}
