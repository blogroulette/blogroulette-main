 

set -x


# Install virtualbox guest utils on debian 9 (stretch) netinst VM
echo "deb http://ftp.debian.org/debian stretch-backports main contrib" | tee /etc/apt/sources.list.d/stretch-backports.list
apt update
apt install -y \ 
    virtualbox-guest-utils \
    virtualbox-guest-dkms \
    virtualbox-guest-x11 \
    linux-headers-$(uname -r)


# Install packaged dependencies
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


# Get wildfly
wget -nv -O wildfly12.tar.gz http://download.jboss.org/wildfly/12.0.0.Final/wildfly-12.0.0.Final.tar.gz


# Get frontend dependencies (nodejs, npm, yarn and generator-ngx-rocket)
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

npm i -g n
n 9
npm i -g yarn
npm i -g @angular/cli
npm i -g generator-ngx-rocket


# Install docker
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


# Reboot
echo "Please reboot now so changed privileges are updated"
echo "$> sudo reboot"
