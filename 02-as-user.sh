#/bin/bash

set -x

# Setup
tar -xzf wildfly12.tar.gz

git pull
git submodule update

cd backend  && ./Dockerbuild.sh; cd ..
cd frontend && yarn install && ./Dockerbuild.sh; cd ..

cp backend/target/blogroulette-jee.war wildfly-12.0.0.Final/standalone/deployments/blogroulette-jee.war

# Run it
wildfly-12.0.0.Final/bin/standalone.sh &
cd frontend && yarn start &
