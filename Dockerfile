FROM node:16

# Add backports
RUN echo "deb http://http.debian.net/debian buster-backports main" >> /etc/apt/sources.list

# Upgrade and Install packages
RUN apt-get update && apt-get -y upgrade && apt-get install -y git openssh-server && apt-get -t buster-backports install -y openjdk-11-jdk
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release &&  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - &&  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && apt-get update && apt-get install -y docker-ce-cli && usermod -aG docker jenkins

# Add user and group for jenkins
RUN groupadd -g 10000 jenkins
RUN useradd -m -u 10000 -g 10000 jenkins
RUN echo "jenkins:jenkins" | chpasswd

# Prepare container for ssh
RUN mkdir /var/run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]