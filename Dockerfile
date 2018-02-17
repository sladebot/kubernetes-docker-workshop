FROM node:7.5.0
MAINTAINER Souranil Sen <sosen@cs.stonybrook.edu>

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

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

# v1.0
# RUN npm install -g gulp

CMD ["npm", "start"]

