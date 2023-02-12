# python-flask-docker-kubernetes
Dockerize A Simple Flask App and deploy using Docker Compose and Kubernetes 


In this project, we will dockerize a simple Python Flask application using Flask and docker compose. We will build the docker image from a Dockerfile, and push to a remote repository (Docker hub) – as part of a CI/CD pipeline. 

We will use docker compose (an orchestration tool) to manage the container and ensure the container automatically restarts if stopped.

Finally, we will deploy 2 instances of our containerized flask app on Kubernetes which helps to scale the application.



Containerization

This is the process of packaging an application with all its dependencies into an isolated unit called container. This can then be deployed in any computing environment – on-premises or cloud. Docker is one of the most popular containerization tools that helps achieve this.



Prerequisite
1. VS code
2. Docker Hub account
3. GitHub account
4. Docker 
5. Docker compose
6. Kubernetes


Steps
1. Create a remote repository on GitHub and clone to a local machine
2. Python Flask Application Layout
3. Build the docker image and push to Docker Hub
4. Deploy the application using Docker
5. Deploy the application using Docker Compose
6. Push all configuration files/codes to GitHub 
7. Deploy the application in a Kubernetes environment


Step 1: Create a remote repository and clone on a local machine

Create a new repository on GitHub and call it python-flask-docker-kubernetes

![image](https://user-images.githubusercontent.com/74336816/218289693-bbcc6bbc-fdfd-4921-9cbc-51e2b7333b14.png)


Run the command below to clone to our host machine:

![image](https://user-images.githubusercontent.com/74336816/218289840-2a3c0740-d12e-47d1-9427-2848aaf53ff1.png)






