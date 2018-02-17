# node-js-sample

A barebones Node.js app using [Express 4](http://expressjs.com/).

## Running Locally

Make sure you have [Node.js](http://nodejs.org/) 

```
npm install
npm start
```

Your app should now be running on [localhost:5000](http://localhost:5000/).

#### Getting started with Docker

1. What are Dockerfiles ?

Let's get started with a based Node.js app ->

Dockerfile:

FROM node:7.5.0
MAINTAINER Souranil Sen <sosen@cs.stonybrook.edu>

RUN apt-get update \
    && apt-get install -y wget make g++ python \
    && apt-get install -y build-essential


# Exposes the PORT
EXPOSE 5000

# Copies all files in current directory to /app in container
ADD . /app

# Sets Work Directory to /app
WORKDIR /app

RUN npm install
# RUN npm install -g gulp


CMD ["npm", "start"]



2. Let's build our image

docker build -t test:latest .

3. So where do these images stay ? 

Registry !

i. docker ps

4. Docker run : docker run -p 5000:5000 test:latest

5. Port Forwarding : curl localhost:5000

docker run -p 27017:27017



### MongoDB: 

1. docker run mongo



Docker compose

docker-compose up







### Kubernetes 

Install minikube: [https://kubernetes.io/docs/getting-started-guides/minikube/](https://kubernetes.io/docs/getting-started-guides/minikube/)

1. Checkout vegeta-broker.json
2. Starting the app - `kubectl apply -f vegeta-broker.json`
3. `kubectl get deployment`
4. `kubectl get services`
5. `kubectl get pods` --> `kubectl delete pod <>`
6. `kubectl get pods`


##### Scale

1. `kubectl get pods`
2. `kubectl scale deployment vegeta-broker --replicas=2`
--> `kubectl get pods`
3. `kubectl scale deployment vegeta-broker --replicas=1`




### Expose a service

1. `kubectl expose deployment vegeta-broker --type=LoadBalancer --name=vegeta-broker-ext`
2. `kubectl get services`

Check the external IP / URL

1. Use it as the host with the port exposed to connect to the service