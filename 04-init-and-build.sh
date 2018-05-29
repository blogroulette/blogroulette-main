#/bin/bash
#
set -x

tar -xzf wildfly12.tar.gz

git clone --recurse-submodules https://github.com/blogroulette/blogroulette-main blogroulette
cd blogroulette

cd backend  && chmod +x Dockerbuild.sh && ./Dockerbuild.sh; cd ..
cd frontend && chmod +x Dockerbuild.sh && ./Dockerbuild.sh; cd ..

cp backend/target/blogroulette-jee.war wildfly-12.0.0.Final/standalone/deployments/blogroulette-jee.war
