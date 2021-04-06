node {
    
    stage('Git Clone') {
        git credentialsId: 'GIT_LOGIN_CREDENTIALS', url: 'https://github.com/gvanishri/ExpenseTracker.git'                
    }
    
    stage('Compile') {
        sh '/usr/bin/mvn compile'
    }

    stage('Test') {
        sh '/usr/bin/mvn test'
    }

    stage('Package') {
        sh '/usr/bin/mvn clean install'
    } 

    stage('Build Image') {
        //sh 'docker version'
        sh 'docker build -t gvanishri/expensetracker:1.0.$BUILD_NUMBER .'
        sh 'docker build -t gvanishri/expensetracker:latest .'
    }
    
    withCredentials([string(credentialsId: 'DOCKER_HUB_PASSWORD', variable: 'PASSWORD')]) {
	    sh 'docker login -u gvanishri -p $PASSWORD'	
    }
    
    stage('Push Image to Docker Hub') {
        sh 'docker push gvanishri/expensetracker:1.0.$BUILD_NUMBER'
	    sh 'docker push gvanishri/expensetracker:latest'
    }
    
    stage('Remove unused docker images') {
	    sh 'docker rmi -f gvanishri/expensetracker:1.0.$BUILD_NUMBER'
        sh 'docker rmi -f gvanishri/expensetracker:latest'
    }

    stage('Using SSH connect to kube8master') {
	    def remote = [:]
        remote.name = 'kube8master'
        remote.host = '18.236.223.16'
        remote.user = 'root'
        remote.password = 'root'
        remote.allowAnyHosts = true
        
        stage('Copy files to kube8server') {
            echo 'Using sshPut copy .yaml configuration files to kube8master in a specified path'
	        sshPut remote: remote, from: 'myapp-deploy.yaml', into: './ExpenseTracker/'
	        sshPut remote: remote, from: 'myapp-service.yaml', into: './ExpenseTracker/'
	    }

	    stage('Deploy Kubernetes') {
            echo 'Using sshCommand - kubectl - deploy .yaml configuration files'
	        sshCommand remote: remote, command: 'kubectl apply -f ./ExpenseTracker/myapp-deploy.yaml'
	        sshCommand remote: remote, command: 'kubectl apply -f ./ExpenseTracker/myapp-service.yaml'
	    }
    }
}