FROM jenkins/inbound-agent:4.10-1-jdk11

# Install Node.js
USER root
RUN apk add --update nodejs npm
USER jenkins
