pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'mern-app' // Docker image name
        MONGO_URL = 'mongodb+srv://admin-dashboard:7EiKEcUpxlx3KbAR@cluster0.ca6w2jn.mongodb.net/?retryWrites=true&w=majority' // MongoDB URL
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
                    // Stop and remove any existing Nginx container
                    sh "docker stop nginx-server || true"
                    sh "docker rm nginx-server || true"
            
                    // Run Nginx container to serve static files
                    sh "docker run -d --name nginx-server -p 80:80 -v $(pwd)/client/build:/usr/share/nginx/html nginx"
            
                    // Run Docker container for the application with MongoDB URL passed as environment variable
                    sh "docker run -d --name $DOCKER_IMAGE -e MONGO_URL=$MONGO_URL -p 5001:5001 $DOCKER_IMAGE"
                }
            }

        }
    }
}
