FROM node:latest
RUN apt-get update && apt-get install -y default-jdk
RUN npm install -g npm
RUN npm install -g n
RUN n stable
RUN npm install -g pm2
RUN mkdir -p /home/jenkins/agent
WORKDIR /home/jenkins/agent