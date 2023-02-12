# Dockerize A Simple Python Flask App and deploy using Docker Compose and Kubernetes 


In this project, we will dockerize a simple Python Flask application using Flask and docker compose. We will build the docker image from a Dockerfile, and push to a remote repository (Docker hub) – as part of a CI/CD pipeline. 

We will use docker compose (an orchestration tool) to manage the container and ensure the container automatically restarts if stopped.

Finally, we will deploy 2 instances of our containerized flask app on Kubernetes which helps to scale the application.



## Containerization

This is the process of packaging an application with all its dependencies into an isolated unit called container. This can then be deployed in any computing environment – on-premises or cloud. Docker is one of the most popular containerization tools that helps achieve this.



## Prerequisite
1. VS code
2. Docker Hub account
3. GitHub account
4. Docker 
5. Docker compose
6. Kubernetes


## Steps
1. Create a remote repository on GitHub and clone to a local machine
2. Python Flask Application Layout
3. Build the docker image and push to Docker Hub
4. Deploy the application using Docker
5. Deploy the application using Docker Compose
6. Push all configuration files/codes to GitHub 
7. Deploy the application in a Kubernetes environment


## Step 1: Create a remote repository and clone on a local machine

Create a new repository on GitHub and call it **python-flask-docker-kubernetes**

![image](https://user-images.githubusercontent.com/74336816/218289693-bbcc6bbc-fdfd-4921-9cbc-51e2b7333b14.png)


Run the command below to clone to our host machine:

            git clone git@github.com:adeola2020-git/python-flask-docker-kubernetes.git



## Step 2: Python Flask Application Layout

cd into the cloned dicrectory and create the following files needed to dockerize our flask application. 

a). app.py

b). Dockerfile

c). requirements.txt

d). docker-compose.yaml


We should have the files in python-flask-docker-kubernetes directory once finished:

      ls

![image](https://user-images.githubusercontent.com/74336816/218290820-94c41914-16d4-4983-b974-9f2fd0946c31.png)


### a). **app.py** - the Python script to build our Flask Application

Flask is a lightweight Python framework used for building web applications. We will create a Flask application that displays the message **‘Hello from Docker! This is a simple Python Flask app’** message on the browser.

The cloned repository on our local machine automatically created a folder called **python-flask-docker-kubernetes**, where we will store all needed files for the flask app and cd into it. 
Then, we will create our app.py file which will contain the Python code for the flask application.

Here is the code for the simple Flask App:

![image](https://user-images.githubusercontent.com/74336816/218290916-8fa92ffd-6e45-47c2-a2b7-67df8cf92c83.png)

To containerize the application we use **app.run(host="0.0.0.0", port=80)** because the local port **127.0.0.1** cannot be captured inside a Docker container. Also, Flask uses port **5000** by default, so we change it to port **80**.


### b). Create a Dockerfile

A Dockerfile will be used to create an image for our Flask App. It contains instructions on how to create the Flask App.

![image](https://user-images.githubusercontent.com/74336816/218291080-ff980303-b823-4a87-9a54-2455484b0906.png)

#### Instructions in our Dockerfile

```
FROM python:3.9-alpine  – initializes a new build stage and sets the Base Image for subsequent instructions. Our Base Image is python:3.9-alpine

MAINTAINER Adeola Adefolaju "aadefolaju@gmail.com" – describes who created the image.

WORKDIR /app - sets the working directory for any RUN, CMD, and COPY instructions that follow it in the Dockerfile. It will set our working directory as /app. This will be the root of our container.

COPY ./ ./  -- copies the files needed to build the image on the host to the WORKDIR on the container, /app.

RUN pip install -r requirements.txt - will execute the commands set – install the dependencies stored in the requirement.txt file at /app.

CMD python app.py  – provides defaults for our executing container. So, python app.py will be executed when the container is ready.
```

### c). requirements.txt

This file contains the dependencies or packages required for our Flask App to run. The content of the file is below;

![image](https://user-images.githubusercontent.com/74336816/218291335-401bdf2b-aec4-4b57-8a9b-36925b2ec161.png)


### d). Create the docker compose file 

Docker Compose is a tool for defining and running multi-container Docker applications. With Compose, we will use a yaml file to configure our App’s services. The application stack can then be built by running a Docker Compose command – **docker compose up**. 

The contents of the file is: 

![image](https://user-images.githubusercontent.com/74336816/218291396-e24a8ec9-91a8-4360-a87d-bff3cf27d4f3.png)



## Step 3: Build the Docker Image and push to Docker Hub

Next, we build the image from the Dockerfile and verify its created:

        docker build -t adeola007/dockerize-python-flask-demo:v1 .


Then, view created image:

  
        docker images

##### Building the image

![image](https://user-images.githubusercontent.com/74336816/218291571-446b9125-e887-4a79-91cb-37e48d31d4a4.png)

##### Verify the created image
 
![image](https://user-images.githubusercontent.com/74336816/218292000-4e903040-f8f7-4729-b636-c24abd4cb837.png)

Next, we push the built image to Docker Hub. To do this, we need to log in to Docker Hub first. We would be asked for log in credentials to Docker Hub.

Log in

              docker login

Then, push

              docker push adeola007/dockerize-python-flask-demo:v1  

![image](https://user-images.githubusercontent.com/74336816/218292416-1a4e295d-b522-4373-a68d-97f1bd814f2b.png)

![image](https://user-images.githubusercontent.com/74336816/218292418-4704ed41-9316-453e-9171-d597e1d3ec0a.png)




## Step 4: Deploy the application using Docker

Now we will run the container image and view the running container. Once this is done, we verify our deployed python flask app by navigating to **http://localhost:80/** to access our Flask web application on a browser or on the terminal with the **curl** command to see the contents of the webpage.  

              docker run -d -p 80:80 --name flask-web adeola007/dockerize-python-flask-demo:v1

Note that the **-p 80:80** parameter, maps the port 80 on the docker container to port 80 on the host. This shows that we are able to access the Flask app on port 80.

Verify the running container

              docker ps

View the web page

              curl localhost:80
              Hello from Docker! This is a simple Python Flask app.


![image](https://user-images.githubusercontent.com/74336816/218292599-56a8c540-2411-4bb6-b8de-60099cf6eede.png)


![image](https://user-images.githubusercontent.com/74336816/218292608-61928665-aa93-4f95-a1c4-b231a0cb19aa.png)


Stop the running container

              docker stop 87b4d4a58e7e 

Verify 

              docker ps



## Step 5: Deploy the application using Docker Compose

To deploy the application using docker compose we run:

              docker compose up

![image](https://user-images.githubusercontent.com/74336816/218292701-696745a0-2f08-4340-a855-07f8fceeb82c.png)


Notice that its faster to deploy since we have built the image already and the build layers have been cached. We also verify our deployed app by navigating to **http://localhost:80/** to access your Flask web application on a browser. On the terminal, run use **CTRL + c** to stop the service.

![image](https://user-images.githubusercontent.com/74336816/218292730-53d7d993-0c6e-4b35-bae2-7405b03a7059.png)

![image](https://user-images.githubusercontent.com/74336816/218292761-60f11b5e-8a96-4b92-89ea-d1473efbb82f.png)



## Step 6: Push all configuration files/codes to GitHub

Next, we need to push all our configuration files with codes to GitHub to enable collaboration and code re-use. 

Check the status of all the files in the working directory;

               git status 

![image](https://user-images.githubusercontent.com/74336816/218293010-d4b74321-1bfe-44d0-b69b-5760b230976b.png)

Move all files in the directory to the staging area, check the status. Then commit to local Git repo:

              git add .

Check status

              git status
 
 ![image](https://user-images.githubusercontent.com/74336816/218292991-2c9197f5-a22a-407d-9b11-b4a148cd16ea.png)


Commit the changes

              git commit -m “added configuration files”
              
![image](https://user-images.githubusercontent.com/74336816/218293090-1abc7a9d-0362-4be3-b5c2-a2956517a142.png)

Check status

![image](https://user-images.githubusercontent.com/74336816/218293099-6b872286-9d50-45ed-a7ec-dab787eceeb0.png)


Push to the remote repository on GitHub
              
              git push -u origin master 
              
![image](https://user-images.githubusercontent.com/74336816/218293128-11318fae-a5bf-49b2-bd5f-8c9df68892fb.png)


Confirm by refreshing the repository page on GitHub

![image](https://user-images.githubusercontent.com/74336816/218293151-1d795e78-8410-471e-90c8-d7126eba994a.png)



## Step 7: Deploy the Flask Application in a Kubernetes Environment
To do this, we will use a Kubernetes cluster already set up by [Killercoda](https://killercoda.com/playgrounds/scenario/kubernetes).

Confirm the cluster set-up and nodes ready.

![image](https://user-images.githubusercontent.com/74336816/218293282-4ecf10d4-cd6e-4d48-9518-f5837e1a925a.png)


Check any resources currently running in the cluster:

![image](https://user-images.githubusercontent.com/74336816/218293306-8d1cbc34-edf5-4f4b-86fd-20d07570666e.png)


Create a deployment yaml file for our Python flask application:

![image](https://user-images.githubusercontent.com/74336816/218293326-32c739ee-b4d2-492c-a8b1-53bdf982292d.png)


Here, we are making use of our image pushed to Docker Hub earlier, **adeola007/dockerize-python-flask-demo:v1** to deploy the flask app. We are deploying 2 instances of the app to load-balance between them.

Let’s create our deployment from the yaml file and confirm. 2 pods are created.

![image](https://user-images.githubusercontent.com/74336816/218293405-a0817fd1-3454-49bd-a82b-8cf664e36a17.png)

![image](https://user-images.githubusercontent.com/74336816/218293410-c4306328-2195-4ea4-9137-29703cf08ba8.png)


#### View the contents of the container image in the pod.

We can view the contents/files used to build our image in the container by executing commands in the container in the running Pod.

To access/view our flask application, we do a port-forward or create a service which also helps to load-balance traffic between the pods/instances of our application. Here, we see the contents of our Dockerfile used to build the container image and well as the application codes in **app.py**. To exit the container, run **exit**.


![image](https://user-images.githubusercontent.com/74336816/218293459-30df56b1-1076-4ee4-b1f0-d4b312dd206c.png)

![image](https://user-images.githubusercontent.com/74336816/218293469-afa2964b-e206-4305-846a-48219af93278.png)

We see the content of our web page when we do a **port-forward** on the terminal and run the curl command on another terminal.

![image](https://user-images.githubusercontent.com/74336816/218293500-aaf8921b-2871-4fca-9133-df0906bece0f.png)

Note that the **80:80** parameter, maps the port 80 on the docker container to port 80 on the host. This shows that we are able to access the Flask app on port 80.

![image](https://user-images.githubusercontent.com/74336816/218293507-90106810-da8f-45c4-946a-bbd403dffc52.png)


#### Creating a NodePort Service

A NodePort service will allow access to our app outside the kubernetes cluster. We will create a NodePort Service so the web page can be viewed externally. To do this, we create a service yaml file and create the service.

![image](https://user-images.githubusercontent.com/74336816/218293632-d915ec50-de18-47a0-9139-d1893ebec5f2.png)


Let’s create our python-web-svc service and confirm.

Create the service

![image](https://user-images.githubusercontent.com/74336816/218293643-60a3f04b-a1cf-4d36-b776-c7e5bea218eb.png)

Confirm

![image](https://user-images.githubusercontent.com/74336816/218293694-1c368d4c-d0db-41e7-9275-ced7c6106780.png)

The NodePort service also generates a cluster ip, we can check external access to the flask app by running a curl command with the generated cluster IP and append the container port to it.

![image](https://user-images.githubusercontent.com/74336816/218293859-9dae537b-d81c-40f3-9e0d-48c605772019.png)


## Conclusion

We have demonstrated simple steps on how to dockerize a Simple Flask App and deploy directly on using Docker, Docker Compose and on a Kubernetes cluster. 



