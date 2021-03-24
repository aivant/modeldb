#!/bin/bash
set -e
mvn clean
mvn package -Dmaven.test.skip=true
docker build --no-cache -t gcr.io/vantai-analysis/modeldb-backend:latest -f dockerfile --rm .
