#/bin/bash

set -x

tar -xzf wildfly12.tar.gz

git pull
git submodule update

cd backend  && chmod +x Dockerbuild.sh && ./Dockerbuild.sh; cd ..
cd frontend && chmod +x Dockerbuild.sh && ./Dockerbuild.sh; cd ..

cp backend/target/blogroulette-jee.war wildfly-12.0.0.Final/standalone/deployments/blogroulette-jee.war

wildfly-12.0.0.Final/bin/standalone.sh &
cd frontend && yarn start &
