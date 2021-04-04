# Project title

### ExpenseTracker

** Version 1.0.0 **

##  About / Synopsis

* Project status: working/prototype

##  Getting started

Instructios will guide to setup working environment for development and testing purposes. Deployment notes guides you to deploy the project on a live system.

>   * [Installation](#installation)

>   * [Deployment](#deployment)

>   * [Contribution](#contribution)

>   * [License](#license)

---

##  Installation

1.  Initially you should have administrator privileges, to setup the environment

2.  Using the yum package manager install ansible, follow the steps given:

    ``` 
    yum install python3

    pip3 install ansible

    ansible --version
    ```    
    after installing ansible,

3.  Use the ansible playbook provisioned install git, Java 8 runtime environments or java jdk, and Jenkins with maven.

    Run the ansible playbook (e.g myplaybook.yaml) then, we can verify the installation

    ```
    ansible-playbook myplaybook.yaml
            
    git --version

    java -version

    echo $JAVA_HOME

    mvn --version

    echo $MAVEN_HOME
    ```
    once verified we can move on with deployment process

##  Deployment

1.  Clone the github repository

    e.g github public repo link:

    ```
    git clone https://github.com/gvanishri/ExpenseTracker.git 
    ```

    use relavent commands, to commit and push to the repo
    ```
    git status
    
    git add *
    
    git commit -m "initial commit"
    
    git push -u origin master
    ```

2.  Using - Jenkins plugin manage credentials - establish docker hub credentials

3.  Deploy jenkins pipeline job - using Jenkins file in the github repository

4.  Jenkins build will push the image to docker hub 

    docker hub repository link: [DockerHub](https://hub.docker.com)

5.  Runtime setup kubernetes server environment, 
    we can deploy the docker hub image by using yaml configuration files in the github repository.

    e.g myappdeploy.yaml, myappservice.yaml

    ```
    kubectl get nodes
    
    kubectl apply -f myappdeploy.yaml
    
    kubectl apply -f myappservice.yaml

    kubectl get all

    curl http://localhost:31000
    ```

5.  After kubernetes orchestration - hit the browser

    you can view the Expense Splitter - Register User page on the browser

##  Contribution

    [RRC Academy](https://www.rrcacademy.com/ "RRC Academy")

##  License

    RRC Academy - A global education and training partner

---