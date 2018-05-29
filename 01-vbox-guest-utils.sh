#/bin/bash
# Install virtualbox guest utils on debian 9 (stretch) netinst VM (run as root)
set -x

echo "deb http://ftp.debian.org/debian stretch-backports main contrib" | tee /etc/apt/sources.list.d/stretch-backports.list
apt update
apt install -y \ 
    virtualbox-guest-utils \
    virtualbox-guest-dkms \
    virtualbox-guest-x11 \
    linux-headers-$(uname -r)
