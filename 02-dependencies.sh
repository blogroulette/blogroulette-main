#/bin/bash
# Install dependencies (run as root)
set -x 

apt update
apt upgrade
apt install -y \
    build-essential \
    gcc \
    mariadb-server \
    mariadb-client \
    openjdk-8-jdk \
    maven \
    wget \
    curl \
    git \
    apt-transport-https \
    ca-certificates \
    gnupg2 \
    software-properties-common

wget -nv -O wildfly12.tar.gz http://download.jboss.org/wildfly/12.0.0.Final/wildfly-12.0.0.Final.tar.gz

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

npm i -g n
n 9
npm i -g yarn
npm i -g generator-ngx-rocket

apt remove docker docker-engine docker.io
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable"
apt update
apt install -y docker-ce

systemctl enable docker
systemctl start docker

usermod -aG docker blogroulette
