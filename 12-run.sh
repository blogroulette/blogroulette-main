#/bin/bash

echo "blogroulette is at $(git status --branch --short | head -1)"
echo "frontend     is at $(cd frontend && git status --branch --short | head -1)"
echo "backend      is at $(cd backend && git status --branch --short | head -1)"

set -x

wildfly-12.0.0.Final/bin/standalone.sh &
cd frontend && yarn start &
