FROM jenkins/jenkins:lts
USER root

# install prerequistits
RUN apt-get update && apt-get -y install \
    iputils-ping \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# install docker
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update && apt-get -y install docker-ce docker-ce-cli containerd.io
RUN usermod -aG docker jenkins

# install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl; \
    chmod +x ./kubectl; \
    mv ./kubectl /usr/local/bin/kubectl

ENTRYPOINT ["/usr/local/bin/jenkins.sh"]