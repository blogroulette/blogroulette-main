#/bin/bash

set -x

wildfly-12.0.0.Final/bin/standalone.sh &
cd frontend && yarn start &
