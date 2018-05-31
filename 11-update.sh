#/bin/bash

set -x


git pull
git submodule update --remote
git submodule foreach git pull origin master


cd backend  && ./Dockerbuild.sh; cd ..
cd frontend && yarn install && ./Dockerbuild.sh; cd ..

cp backend/target/blogroulette-jee.war wildfly-12.0.0.Final/standalone/deployments/blogroulette-jee.war
