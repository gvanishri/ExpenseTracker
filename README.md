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

    Initially you should have administrator privileges, to setup the environment

    Using the yum package manager install ansible, follow the steps given:

    ``` bash
    yum install python3

    pip3 install ansible

    ansible --version
    ```
    after installing ansible

    the ansible playbook provisioned we can install git, Java 8 runtime environments or java jdk, and Jenkins with maven.

    e.g myplaybook.yaml
    ```
    ansible-playbook myplaybook.yaml
    ```

    then, we can verify the installation
    ```
    git --version

    java -version

    echo $JAVA_HOME

    mvn --version

    echo $MAVEN_HOME
    ```

##  Deployment

1.  Clone the github repository

    e.g github public repo link: [GitHub](https://github.com/gvanishri/ExpenseTracker.git)

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