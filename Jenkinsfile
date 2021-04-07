pipeline {
    environment {
        registry = "gvanishri/expensetracker"
        registryCredential = 'dockerID'
        dockerImage = ''
    }    

    agent any

    stages {

        stage('Clone GitHub repository') {
            steps {
                git credentialsId: 'GIT_LOGIN_CREDENTIALS', url: 'https://github.com/gvanishri/ExpenseTracker.git'
            }
        }

        stage('Compile') {
            steps {
                sh '/usr/bin/mvn compile'
            }
        }

        stage('Test') {
            steps {
                sh '/usr/bin/mvn test'
            }            
        }

        stage('Package') {
            steps {
                sh '/usr/bin/mvn clean install'
            }
        } 

        stage('Build image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }

        stage('Deploy image') {
            steps {
                script {
                    docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
                        dockerImage.push("1.0.$BUILD_NUMBER")
                        dockerImage.push("latest")  
                    }
                }
            }
        }  
        
        stage('Remove Unused docker image') {
            steps{
                sh "docker rmi $registry:$BUILD_NUMBER"
                sh "docker rmi registry.hub.docker.com/$registry:latest"
                sh "docker rmi registry.hub.docker.com/$registry:1.0.$BUILD_NUMBER"
            }
        }        
    }
    
    post {
        always {
            cleanWs()
        }
    }
}