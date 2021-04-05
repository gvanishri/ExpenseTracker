FROM openjdk:11

MAINTAINER gvanitha.shri@gmail.com

USER root

RUN mkdir -p ExpenseTracker/Workdir

WORKDIR /ExpenseTracker/Workdir

VOLUME /ExpenseTracker/Workdir

ADD target/ExpenseTracker-Spring-1.0-SNAPSHOT.jar /ExpenseTracker/Workdir/ExpenseTracker-Spring-1.0-SNAPSHOT.jar

EXPOSE 8080

ENTRYPOINT ["/usr/bin/java","-jar","/ExpenseTracker/Workdir/ExpenseTracker-Spring-1.0-SNAPSHOT.jar"]
